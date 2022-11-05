## Welcome to LeanQt - the lean, adaptable Qt version

LeanQt is a stripped-down Qt version which includes the essential features and is easy to build from source and to integrate with an application.

My primary motivation for LeanQt was to make my Oberon compiler (and also the IDE in future) easier to compile and deploy on all relevant platforms with as few dependencies as possible. Many of my tools are based on Qt 5, which is an excellent framework that provides all the necessary features in a platform-independent way. Qt 5 has low requirements for the C++ compiler and is available virtually on all platforms where there is a C++98 compiler. 

Unfortunately, there has been a certain proliferation over the years where Qt has been bloated with all sorts of features with questionable value. The standard binary installation of Qt swallows several gigabytes and requires a login to a commercial company server, which discourages many people. The non-essential features make the build more complicated (higher probability of missing dependencies or incompatiblities). The now initiated development with Qt 6 makes higher demands on compiler and system, and follows a development that I cannot make sense of. For applications using only the non-gui part of Qt, or only basic GUI features, these are significant impediments. 

For LeanQt I used the code of Qt 5.6.3 which was the last Qt version available under both LGPL v2.1 and v3. Instead of qmake the BUSY build system (see https://github.com/rochus-keller/BUSY) is used, which was one of the reasons I implemented it. LeanQt has a different source tree structure compared to the original Qt toolkit; a lot of the original subdirectories (e.g. mkspecs, qmake) are no longer required; there are no longer separate subdirectories under corelib since each was depending on every other anyway. I also added additional configuration options so it is possible to use a minimal version even without the file engine and core application (see the BUSY file in the root for more information); many changes were necessary to the original source code for this, but the API is mostly the same and thus the original Qt documentation is still valid.

### State of development

This version is suited to successfully build and run the command line version of my Oberon+ compiler and the LeanQt examples with different configurations on Windows x86, on macOS x86_64 and M1, and on Linux x86 and x86_64; other Linux architectures are work in progress.

The following features are available: 

- bytearrays, strings, unicode
- data compression
- localization
- collections, implicit sharing
- date/time, time zones
- variants/metatypes
- codecs: utf, latin
- io device abstraction
- file engine
- text and data streams
- regexp
- logging
- md5 and sha1 hash
- geometry, json, url
- xml stream, sax and dom
- threads, processes
- shared memory
- application, command line
- objects and events
- rcc (resource compiler)
- moc (meta object compiler)
- library and plugins
- async and sync networking
- map/reduce, filter/reduce, async computation
- image handling, format conversion

### Planned or work-in-progress features

- [x] QtCore 
- [x] QtXml
- [x] QtNetwork
- [x] QtConcurrent
- [x] QImage, QImageReader/Writer (separated from QtGui)
- [ ] QtGui (freetext & qpa mac backend pending)

### Long term plan

- [ ] QtWidgets
- [ ] mimetypes
- [ ] printing
- [ ] SIMD support

### No support planned

- qmake
- statemachine
- other than minimal codecs
- animation
- dbus
- sql
- svg
- nfc
- bluetooth
- multimedia
- web and browser stuff
- testlib
- scripting, quick stuff
- opengl, direct2d, directfb
- qml
- accessibility (requires dbus)
- all not mentioned add-ons 
- ios, winrt, wince, android, blackberry, nacl, vxworks, haiku

### How to build the Oberon+ command line compiler version with LeanQt

1. Create a new directory; we call it the root directory here
1. Download https://github.com/rochus-keller/Oberon/archive/refs/heads/master.zip and unpack it to the root directory; rename the resulting directory to "Oberon".
1. Download https://github.com/rochus-keller/PeLib/archive/refs/heads/OBX.zip and unpack it to the root directory; rename the resulting directory to "PeLib".
1. Download https://github.com/rochus-keller/MonoTools/archive/refs/heads/master.zip and unpack it to the root directory; rename the resulting directory to "MonoTools".
1. Download https://github.com/rochus-keller/LeanQt/archive/refs/heads/master.zip and unpack it to the root directory; rename the resulting directory to "LeanQt".
1. Download https://github.com/rochus-keller/BUSY/archive/refs/heads/master.zip and unpack it to the root directory; rename the resulting directory to "build".
1. Open a command line in the build directory and type `cc *.c -O2 -lm -O2 -o lua` or `cl /O2 /MD /Fe:lua.exe *.c` depending on whether you are on a Unix or Windows machine; wait a few seconds until the Lua executable is built.
1. Now type `./lua build.lua ../Oberon` (or `lua build.lua ../Oberon` on Windows); wait a few minutes until the OBXMC executable is built; you find it in the output subdirectory.

### BUSY moc support

Qt includes a powerful meta-object system which extends the capabilities of C++ (see https://doc.qt.io/qt-5/metaobjects.html). The most prominent feature is the signals and slots mechanism for inter-object communication. To make signals and slots work, a QObject descendant is marked with the `Q_OBJECT`, `signals` and `slots` macros and fed to the Meta-Object Compiler (moc) to generate additional code required by the meta-object system.

LeanQt can be compiled with QObject and `moc` support by setting the HAVE_OBJECT parameter to true. If so, the `moc` tool is automatically built and made available to BUSY based builds.

The BUSY build system used by LeanQt includes the [predeclared `Moc` action class](http://software.rochus-keller.ch/busy_spec.html#12625). Its only field is `sources` which is a list of files which need to be processed. The Moc instance is added to the `deps` list of the `Executable` or `Library` instance which has the effect that moc is called for each entry of `sources` and the resulting new .cpp files are automatically compiled and linked with the executable or library. Here is an example:

Assume we have this code in Example.h:

```
#include <QObject>
#include <QtDebug>

class Example : public QObject
{
	Q_OBJECT
public:
	Example(QObject* p = 0):QObject(p){}
	~Example() { qDebug() << "done"; emit done(); }
signals:
	void done();
public slots:
	void hello() { qDebug() << "Hello from Example"; }
};
```

And this is the code in Example.cpp:

```
#include "Example.h"
#include <QCoreApplication>
#include <QTimer>

int main(int argc, char *argv[])
{
    QCoreApplication app(argc, argv);
    
    qDebug() << "started";
    
    Example* example = new Example();
			
	QTimer t1;
	t1.setSingleShot(true);
	QObject::connect(&t1,SIGNAL(timeout()),example,SLOT(deleteLater()));
	t1.start(2000);
	
	QTimer t2;
	t2.setSingleShot(true);
	QObject::connect(&t2,SIGNAL(timeout()),example,SLOT(hello()));
	t2.start(1000);
	
	QObject::connect(example,SIGNAL(done()),&app,SLOT(quit()));

    return app.exec();
}
```

Assuming the `Example` and `LeanQt` directories are in the same root directory we only need the following BUSY file to build the application:

```
submod qt = ../LeanQt (HAVE_OBJECT)

let moc : Moc {
	.sources += ./Example.h
}

let example ! : Executable {
	.sources += ./Example.cpp
	.deps += [ qt.libqtcore moc ]
	.configs += qt.core_client_config
} 
```

Note that the space between `../LeanQt` and `(HAVE_OBJECT)` is significant (otherwise `(HAVE_OBJECT)` is considered part of the path).

Assuming the BUSY `build` directory is in the same root directory as `LeanQt` and `Example` we can run the build by just executing `lua build.lua ../Example` from the `build` directory (remember that BUSY itself has to first be built, see [here for more information](https://github.com/rochus-keller/BUSY/blob/main/README.md#build-steps)). The resulting executable can then be found in the `build/output` directory and run like `output/example`.

Here is a summary of the directory structure:
```
├─ build
│  └─ output
│     └─ qt
├─ LeanQt
└─ Example
```
This example links the executable with the static library version of LeanQt. If you instead prefer dynamic linking with LeanQt then just add `HAVE_SHARED` to the `submod` parameter list so it looks like `submod qt = ../LeanQt (HAVE_OBJECT,HAVE_SHARED)`. Before you rebuild, delete the `output` directory. The resulting shared library is in the `build/output/qt` directory (on Windows you have to e.g. move it to the `output` directory so the executable can find it). 


### Additional Credits

- Copyright (C) 2016 by The Qt Company Ltd. 
- Copyright (C) 2008 Nokia Corporation and/or its subsidiary(-ies).
- Copyright (C) 1992-2005 Trolltech AS.
- KDAB, https://www.kdab.com/kdab-contributions-to-qt-5-0-part-1/
- The KDE Community, https://community.kde.org/Frameworks/Epics/Contributions_to_Qt5.
- And many individual Qt contributors around the world (I didn't find a contributors list so far; please post a link if you have one, relating to Qt 4.0 to 5.6).

### Support

If you need support or would like to post issues or feature requests please use the Github issue list at https://github.com/rochus-keller/LeanQt/issues or send an email to the author.

