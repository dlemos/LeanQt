/****************************************************************************
**
** Copyright (C) 2015 The Qt Company Ltd.
** Copyright (C) 2022 Rochus Keller (me@rochus-keller.ch) for LeanQt
**
** This file is part of the QtCore module of the Qt Toolkit.
**
** GNU Lesser General Public License Usage
** Alternatively, this file may be used under the terms of the GNU Lesser
** General Public License version 2.1 or version 3 as published by the Free
** Software Foundation and appearing in the file LICENSE.LGPLv21 and
** LICENSE.LGPLv3 included in the packaging of this file. Please review the
** following information to ensure the GNU Lesser General Public License
** requirements will be met: https://www.gnu.org/licenses/lgpl.html and
** http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
**
** As a special exception, The Qt Company gives you certain additional
** rights. These rights are described in The Qt Company LGPL Exception
** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
**
** $QT_END_LICENSE$
**
****************************************************************************/

#define QT_NO_CAST_FROM_ASCII

#include "qmimetypeparser_p.h"

#ifndef QT_NO_MIMETYPE

#include "qmimetype_p.h"
#include "qmimemagicrulematcher_p.h"

#include <QtCore/QDebug>
#ifndef QT_NO_FILEENGINE
#include <QtCore/QDir>
#endif
#include <QtCore/QPair>
#ifndef QT_NO_XMLSTREAM
#include <QtCore/QXmlStreamReader>
#include <QtCore/QXmlStreamWriter>
#endif
#include <QtCore/QStack>

QT_BEGIN_NAMESPACE

// XML tags in MIME files
static const char mimeInfoTagC[] = "mime-info";
static const char mimeTypeTagC[] = "mime-type";
static const char mimeTypeAttributeC[] = "type";
static const char subClassTagC[] = "sub-class-of";
static const char commentTagC[] = "comment";
static const char genericIconTagC[] = "generic-icon";
static const char iconTagC[] = "icon";
static const char nameAttributeC[] = "name";
static const char globTagC[] = "glob";
static const char aliasTagC[] = "alias";
static const char patternAttributeC[] = "pattern";
static const char weightAttributeC[] = "weight";
static const char caseSensitiveAttributeC[] = "case-sensitive";
static const char localeAttributeC[] = "xml:lang";

static const char magicTagC[] = "magic";
static const char priorityAttributeC[] = "priority";

static const char matchTagC[] = "match";
static const char matchValueAttributeC[] = "value";
static const char matchTypeAttributeC[] = "type";
static const char matchOffsetAttributeC[] = "offset";
static const char matchMaskAttributeC[] = "mask";

/*!
    \class QMimeTypeParser
    \inmodule QtCore
    \internal
    \brief The QMimeTypeParser class parses MIME types, and builds a MIME database hierarchy by adding to QMimeDatabasePrivate.

    Populates QMimeDataBase

    \sa QMimeDatabase, QMimeMagicRuleMatcher, MagicRule, MagicStringRule, MagicByteRule, GlobPattern
    \sa QMimeTypeParser
*/

/*!
    \class QMimeTypeParserBase
    \inmodule QtCore
    \internal
    \brief The QMimeTypeParserBase class parses for a sequence of <mime-type> in a generic way.

    Calls abstract handler function process for QMimeType it finds.

    \sa QMimeDatabase, QMimeMagicRuleMatcher, MagicRule, MagicStringRule, MagicByteRule, GlobPattern
    \sa QMimeTypeParser
*/

/*!
    \fn virtual bool QMimeTypeParserBase::process(const QMimeType &t, QString *errorMessage) = 0;
    Overwrite to process the sequence of parsed data
*/

QMimeTypeParserBase::ParseState QMimeTypeParserBase::nextState(ParseState currentState, const QStringRef &startElement)
{
    switch (currentState) {
    case ParseBeginning:
        if (startElement == QLatin1String(mimeInfoTagC))
            return ParseMimeInfo;
        if (startElement == QLatin1String(mimeTypeTagC))
            return ParseMimeType;
        return ParseError;
    case ParseMimeInfo:
        return startElement == QLatin1String(mimeTypeTagC) ? ParseMimeType : ParseError;
    case ParseMimeType:
    case ParseComment:
    case ParseGenericIcon:
    case ParseIcon:
    case ParseGlobPattern:
    case ParseSubClass:
    case ParseAlias:
    case ParseOtherMimeTypeSubTag:
    case ParseMagicMatchRule:
        if (startElement == QLatin1String(mimeTypeTagC)) // Sequence of <mime-type>
            return ParseMimeType;
        if (startElement == QLatin1String(commentTagC ))
            return ParseComment;
        if (startElement == QLatin1String(genericIconTagC))
            return ParseGenericIcon;
        if (startElement == QLatin1String(iconTagC))
            return ParseIcon;
        if (startElement == QLatin1String(globTagC))
            return ParseGlobPattern;
        if (startElement == QLatin1String(subClassTagC))
            return ParseSubClass;
        if (startElement == QLatin1String(aliasTagC))
            return ParseAlias;
        if (startElement == QLatin1String(magicTagC))
            return ParseMagic;
        if (startElement == QLatin1String(matchTagC))
            return ParseMagicMatchRule;
        return ParseOtherMimeTypeSubTag;
    case ParseMagic:
        if (startElement == QLatin1String(matchTagC))
            return ParseMagicMatchRule;
        break;
    case ParseError:
        break;
    }
    return ParseError;
}

// Parse int number from an (attribute) string
bool QMimeTypeParserBase::parseNumber(const QString &n, int *target, QString *errorMessage)
{
    bool ok;
    *target = n.toInt(&ok);
    if (!ok) {
        *errorMessage = QString::fromLatin1("Not a number '%1'.").arg(n);
        return false;
    }
    return true;
}

#ifndef QT_NO_XMLSTREAMREADER
static QMimeMagicRule *createMagicMatchRule(const QXmlStreamAttributes &atts, QString *errorMessage)
{
    const QString type = atts.value(QLatin1String(matchTypeAttributeC)).toString();
    const QString value = atts.value(QLatin1String(matchValueAttributeC)).toString();
    const QString offsets = atts.value(QLatin1String(matchOffsetAttributeC)).toString();
    const QString mask = atts.value(QLatin1String(matchMaskAttributeC)).toString();
    return new QMimeMagicRule(type, value.toUtf8(), offsets, mask.toLatin1(), errorMessage);
}
#endif

bool QMimeTypeParserBase::parse(QIODevice *dev, const QString &fileName, QString *errorMessage)
{
#ifdef QT_NO_XMLSTREAMREADER
    if (errorMessage)
        *errorMessage = QString::fromLatin1("QXmlStreamReader is not available, cannot parse.");
    return false;
#else
    QMimeTypePrivate data;
    int priority = 50;
    QStack<QMimeMagicRule *> currentRules; // stack for the nesting of rules
    QList<QMimeMagicRule> rules; // toplevel rules
    QXmlStreamReader reader(dev);
    ParseState ps = ParseBeginning;
    QXmlStreamAttributes atts;
    while (!reader.atEnd()) {
        switch (reader.readNext()) {
        case QXmlStreamReader::StartElement:
            ps = nextState(ps, reader.name());
            atts = reader.attributes();
            switch (ps) {
            case ParseMimeType: { // start parsing a MIME type name
                const QString name = atts.value(QLatin1String(mimeTypeAttributeC)).toString();
                if (name.isEmpty()) {
                    reader.raiseError(QString::fromLatin1("Missing '%1'-attribute").arg(QString::fromLatin1(mimeTypeAttributeC)));
                } else {
                    data.name = name;
                }
            }
                break;
            case ParseGenericIcon:
                data.genericIconName = atts.value(QLatin1String(nameAttributeC)).toString();
                break;
            case ParseIcon:
                data.iconName = atts.value(QLatin1String(nameAttributeC)).toString();
                break;
            case ParseGlobPattern: {
                const QString pattern = atts.value(QLatin1String(patternAttributeC)).toString();
                unsigned weight = atts.value(QLatin1String(weightAttributeC)).toString().toInt();
                const bool caseSensitive = atts.value(QLatin1String(caseSensitiveAttributeC)).toString() == QLatin1String("true");

                if (weight == 0)
                    weight = QMimeGlobPattern::DefaultWeight;

                Q_ASSERT(!data.name.isEmpty());
                const QMimeGlobPattern glob(pattern, data.name, weight, caseSensitive ? Qt::CaseSensitive : Qt::CaseInsensitive);
                if (!process(glob, errorMessage))   // for actual glob matching
                    return false;
                data.addGlobPattern(pattern); // just for QMimeType::globPatterns()
            }
                break;
            case ParseSubClass: {
                const QString inheritsFrom = atts.value(QLatin1String(mimeTypeAttributeC)).toString();
                if (!inheritsFrom.isEmpty())
                    processParent(data.name, inheritsFrom);
            }
                break;
            case ParseComment: {
                // comments have locale attributes. We want the default, English one
                QString locale = atts.value(QLatin1String(localeAttributeC)).toString();
                const QString comment = reader.readElementText();
                if (locale.isEmpty())
                    locale = QString::fromLatin1("en_US");
                data.localeComments.insert(locale, comment);
            }
                break;
            case ParseAlias: {
                const QString alias = atts.value(QLatin1String(mimeTypeAttributeC)).toString();
                if (!alias.isEmpty())
                    processAlias(alias, data.name);
            }
                break;
            case ParseMagic: {
                priority = 50;
                const QString priorityS = atts.value(QLatin1String(priorityAttributeC)).toString();
                if (!priorityS.isEmpty()) {
                    if (!parseNumber(priorityS, &priority, errorMessage))
                        return false;

                }
                currentRules.clear();
                //qDebug() << "MAGIC start for mimetype" << data.name;
            }
                break;
            case ParseMagicMatchRule: {
                QString magicErrorMessage;
                QMimeMagicRule *rule = createMagicMatchRule(atts, &magicErrorMessage);
                if (!rule->isValid())
                    qWarning("QMimeDatabase: Error parsing %s\n%s", qPrintable(fileName), qPrintable(magicErrorMessage));
                QList<QMimeMagicRule> *ruleList;
                if (currentRules.isEmpty())
                    ruleList = &rules;
                else // nest this rule into the proper parent
                    ruleList = &currentRules.top()->m_subMatches;
                ruleList->append(*rule);
                //qDebug() << " MATCH added. Stack size was" << currentRules.size();
                currentRules.push(&ruleList->last());
                delete rule;
                break;
            }
            case ParseError:
                reader.raiseError(QString::fromLatin1("Unexpected element <%1>").
                                  arg(reader.name().toString()));
                break;
            default:
                break;
            }
            break;
        // continue switch QXmlStreamReader::Token...
        case QXmlStreamReader::EndElement: // Finished element
        {
            const QStringRef elementName = reader.name();
            if (elementName == QLatin1String(mimeTypeTagC)) {
                if (!process(QMimeType(data), errorMessage))
                    return false;
                data.clear();
            } else if (elementName == QLatin1String(matchTagC)) {
                // Closing a <match> tag, pop stack
                currentRules.pop();
                //qDebug() << " MATCH closed. Stack size is now" << currentRules.size();
            } else if (elementName == QLatin1String(magicTagC)) {
                //qDebug() << "MAGIC ended, we got" << rules.count() << "rules, with prio" << priority;
                // Finished a <magic> sequence
                QMimeMagicRuleMatcher ruleMatcher(data.name, priority);
                ruleMatcher.addRules(rules);
                processMagicMatcher(ruleMatcher);
                rules.clear();
            }
            break;
        }
        default:
            break;
        }
    }

    if (reader.hasError()) {
        if (errorMessage)
            *errorMessage = QString::fromLatin1("An error has been encountered at line %1 of %2: %3:").arg(reader.lineNumber()).arg(fileName, reader.errorString());
        return false;
    }

    return true;
#endif //QT_NO_XMLSTREAMREADER
}

QT_END_NAMESPACE

#endif // QT_NO_MIMETYPE
