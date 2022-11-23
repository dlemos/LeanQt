# Copyright (C) 2022 Rochus Keller (me@rochus-keller.ch) for LeanQt
# licensed under GPL/LGPL

QT       -= core gui

TARGET = test
CONFIG   += console
CONFIG   -= app_bundle

TEMPLATE = app

INCLUDEPATH += ../includes ../includes/QtCore ../includes/QtGui . .. $$PWD/platformsupport

DEFINES += QT_NO_PLUGINS QT_NO_IMAGEFORMATPLUGIN QT_BUILD_GUI_LIB QT_NO_WIDGETS

HEADERS += \
    qabstracttextdocumentlayout_p.h \
    qabstracttextdocumentlayout.h \
    qbackingstore.h \
    qbitmap.h \
    qblittable_p.h \
    qbrush.h \
    qclipboard.h \
    qcosmeticstroker_p.h \
    qcssparser_p.h \
    qcssutil_p.h \
    qcursor_p.h \
    qcursor.h \
    qdistancefield_p.h \
    qdnd_p.h \
    qdrag.h \
    qemulationpaintengine_p.h \
    qevent_p.h \
    qevent.h \
    qfixed_p.h \
    qfont_p.h \
    qfont.h \
    qfontdatabase.h \
    qfontengine_ft_p.h \
    qfontengine_p.h \
    qfontengine_qpf2_p.h \
    qfontengineglyphcache_p.h \
    qfontinfo.h \
    qfontmetrics.h \
    qfontsubset_p.h \
    qfragmentmap_p.h \
    qgenericplugin.h \
    qgenericpluginfactory.h \
    qglyphrun_p.h \
    qglyphrun.h \
    qguiapplication_p.h \
    qguiapplication.h \
    qharfbuzzng_p.h \
    qhighdpiscaling_p.h \
    qicon_p.h \
    qicon.h \
    qiconengine.h \
    qiconengineplugin.h \
    qiconloader_p.h \
    qimagepixmapcleanuphooks_p.h \
    qinputcontrol_p.h \
    qinputdevicemanager_p_p.h \
    qinputdevicemanager_p.h \
    qinputmethod_p.h \
    qinputmethod.h \
    qkeymapper_p.h \
    qkeysequence_p.h \
    qkeysequence.h \
    qnativeimage_p.h \
    qoffscreensurface.h \
    qoutlinemapper_p.h \
    qpagedpaintdevice_p.h \
    qpagedpaintdevice.h \
    qpagelayout.h \
    qpagesize.h \
    qpaintdevicewindow_p.h \
    qpaintdevicewindow.h \
    qpaintengine_blitter_p.h \
    qpaintengine_p.h \
    qpaintengine_pic_p.h \
    qpaintengine_raster_p.h \
    qpaintengine.h \
    qpaintengineex_p.h \
    qpainter_p.h \
    qpainter.h \
    qpalette.h \
    qpathsimplifier_p.h \
    qpdf_p.h \
    qpdfwriter.h \
    qpen_p.h \
    qpen.h \
    qpicture_p.h \
    qpicture.h \
    qpictureformatplugin.h \
    qpixmap_blitter_p.h \
    qpixmap_raster_p.h \
    qpixmap.h \
    qpixmapcache_p.h \
    qpixmapcache.h \
    qplatformaccessibility.h \
    qplatformbackingstore.h \
    qplatformclipboard.h \
    qplatformcursor.h \
    qplatformdialoghelper.h \
    qplatformdrag.h \
    qplatformfontdatabase.h \
    qplatformgraphicsbuffer.h \
    qplatformgraphicsbufferhelper.h \
    qplatforminputcontext_p.h \
    qplatforminputcontext.h \
    qplatforminputcontextfactory_p.h \
    qplatforminputcontextplugin_p.h \
    qplatformintegration.h \
    qplatformintegrationfactory_p.h \
    qplatformintegrationplugin.h \
    qplatformmenu.h \
    qplatformnativeinterface.h \
    qplatformoffscreensurface.h \
    qplatformpixmap.h \
    qplatformscreen_p.h \
    qplatformscreen.h \
    qplatformservices.h \
    qplatformsessionmanager.h \
    qplatformsharedgraphicscache.h \
    qplatformsurface.h \
    qplatformsystemtrayicon.h \
    qplatformtheme_p.h \
    qplatformtheme.h \
    qplatformthemefactory_p.h \
    qplatformthemeplugin.h \
    qplatformwindow_p.h \
    qplatformwindow.h \
    qpolygonclipper_p.h \
    qrasterizer_p.h \
    qrasterwindow.h \
    qrawfont_p.h \
    qrawfont.h \
    qscreen_p.h \
    qscreen.h \
    qsessionmanager_p.h \
    qsessionmanager.h \
    qshapedpixmapdndwindow_p.h \
    qshortcutmap_p.h \
    qsimpledrag_p.h \
    qstatictext_p.h \
    qstatictext.h \
    qstylehints.h \
    qsurface.h \
    qsurfaceformat.h \
    qsyntaxhighlighter.h \
    qtextcursor_p.h \
    qtextcursor.h \
    qtextdocument_p.h \
    qtextdocument.h \
    qtextdocumentfragment_p.h \
    qtextdocumentfragment.h \
    qtextdocumentlayout_p.h \
    qtextdocumentwriter.h \
    qtextengine_p.h \
    qtextformat_p.h \
    qtextformat.h \
    qtexthtmlparser_p.h \
    qtextimagehandler_p.h \
    qtextlayout.h \
    qtextlist.h \
    qtextobject_p.h \
    qtextobject.h \
    qtextodfwriter_p.h \
    qtextoption.h \
    qtexttable_p.h \
    qtexttable.h \
    qtextureglyphcache_p.h \
    qtouchdevice_p.h \
    qtouchdevice.h \
    qwindow_p.h \
    qwindow.h \
    qwindowdefs_win.h \
    qwindowdefs.h \
    qwindowsysteminterface_p.h \
    qwindowsysteminterface.h \
    ../image/qbezier_p.h \
    ../image/qblendfunctions_p.h \
    ../image/qbmphandler_p.h \
    ../image/qcolor_p.h \
    ../image/qcolor.h \
    ../image/qdatabuffer_p.h \
    ../image/qdrawhelper_neon_p.h \
    ../image/qdrawhelper_p.h \
    ../image/qdrawhelper_x86_p.h \
    ../image/qdrawingprimitive_sse2_p.h \
    ../image/qgifhandler_p.h \
    ../image/qimage_p.h \
    ../image/qimage.h \
    ../image/qimageiohandler.h \
    ../image/qimagereader.h \
    ../image/qimagescale_p.h \
    ../image/qimagewriter.h \
    ../image/qjpeghandler_p.h \
    ../image/qmath_p.h \
    ../image/qmatrix.h \
    ../image/qmemrotate_p.h \
    ../image/qpaintdevice.h \
    ../image/qpainterpath_p.h \
    ../image/qpainterpath.h \
    ../image/qpathclipper_p.h \
    ../image/qpixelformat.h \
    ../image/qpnghandler_p.h \
    ../image/qpolygon.h \
    ../image/qppmhandler_p.h \
    ../image/qrasterdefs_p.h \
    ../image/qregion.h \
    ../image/qrgb.h \
    ../image/qrgba64_p.h \
    ../image/qrgba64.h \
    ../image/qstroker_p.h \
    ../image/qtransform.h \
    ../image/qvectorpath_p.h \
    ../image/qxbmhandler_p.h \
    ../image/qxpmhandler_p.h \
    qhexstring_p.h \
    qmimedata.h \
    qsyntaxhighlighter_p.h \
    qvector2d.h \
    qgenericmatrix.h \
    qgrayraster_p.h \
    qharfbuzz_p.h \
    qmatrix4x4.h \
    qquaternion.h \
    qrbtree_p.h \
    qtextboundaryfinder.h \
    qvector3d.h \
    qvector4d.h \
    qzipreader_p.h \
    qzipwriter_p.h \
    xcb/qxcbbackingstore.h \
    xcb/qxcbclipboard.h \
    xcb/qxcbconnection.h \
    xcb/qxcbcursor.h \
    xcb/qxcbdrag.h \
    xcb/qxcbexport.h \
    xcb/qxcbglintegration.h \
    xcb/qxcbglintegrationfactory.h \
    xcb/qxcbglintegrationplugin.h \
    xcb/qxcbimage.h \
    xcb/qxcbintegration.h \
    xcb/qxcbkeyboard.h \
    xcb/qxcbmime.h \
    xcb/qxcbnativeinterface.h \
    xcb/qxcbnativeinterfacehandler.h \
    xcb/qxcbobject.h \
    xcb/qxcbscreen.h \
    xcb/qxcbsessionmanager.h \
    xcb/qxcbsystemtraytracker.h \
    xcb/qxcbwindow.h \
    xcb/qxcbwmsupport.h \
    xcb/qxcbxsettings.h \
    platformsupport/qbasicfontdatabase_p.h \
    platformsupport/qgenericunixeventdispatcher_p.h \
    platformsupport/qgenericunixfontdatabase_p.h \
    platformsupport/qgenericunixservices_p.h \
    platformsupport/qgenericunixthemes_p.h \
    platformsupport/qplatformheaderhelper.h \
    platformsupport/qunixeventdispatcher_qpa_p.h \
    platformsupport/qxcbintegrationfunctions.h \
    platformsupport/qxcbscreenfunctions.h \
    platformsupport/qxcbwindowfunctions.h \
    ../core/NoObject.h \
    ../core/qabstracteventdispatcher_p.h \
    ../core/qabstracteventdispatcher.h \
    ../core/qabstractfileengine_p.h \
    ../core/qabstractnativeeventfilter.h \
    ../core/qalgorithms.h \
    ../core/qarraydata.h \
    ../core/qatomic_armv5.h \
    ../core/qatomic_armv6.h \
    ../core/qatomic_armv7.h \
    ../core/qatomic_bootstrap.h \
    ../core/qatomic_gcc.h \
    ../core/qatomic_ia64.h \
    ../core/qatomic_msvc.h \
    ../core/qatomic_unix.h \
    ../core/qatomic_x86.h \
    ../core/qatomic.h \
    ../core/qbasicatomic.h \
    ../core/qbasictimer.h \
    ../core/qbitarray.h \
    ../core/qbuffer_p.h \
    ../core/qbuffer.h \
    ../core/qbytearray_p.h \
    ../core/qbytearray.h \
    ../core/qbytearraylist.h \
    ../core/qbytearraymatcher.h \
    ../core/qcache.h \
    ../core/qcfsocketnotifier_p.h \
    ../core/qchar.h \
    ../core/qcollator_p.h \
    ../core/qcollator.h \
    ../core/qcommandlineoption.h \
    ../core/qcommandlineparser.h \
    ../core/qcompilerdetection.h \
    ../core/qconfig.h \
    ../core/qcontainerfwd.h \
    ../core/qcontiguouscache.h \
    ../core/qcore_mac_p.h \
    ../core/qcore_unix_p.h \
    ../core/qcoreapplication_p.h \
    ../core/qcoreapplication.h \
    ../core/qcorecmdlineargs_p.h \
    ../core/qcoreevent.h \
    ../core/qcoreglobaldata_p.h \
    ../core/qcryptographichash.h \
    ../core/qdatastream_p.h \
    ../core/qdatastream.h \
    ../core/qdataurl_p.h \
    ../core/qdatetime_p.h \
    ../core/qdatetime.h \
    ../core/qdatetimeparser_p.h \
    ../core/qdebug_p.h \
    ../core/qdebug.h \
    ../core/qdir_p.h \
    ../core/qdir.h \
    ../core/qdiriterator.h \
    ../core/qelapsedtimer.h \
    ../core/qelfparser_p.h \
    ../core/qendian.h \
    ../core/qeventdispatcher_cf_p.h \
    ../core/qeventdispatcher_unix_p.h \
    ../core/qeventdispatcher_win_p.h \
    ../core/qeventloop_p.h \
    ../core/qeventloop.h \
    ../core/qexception.h \
    ../core/qfactoryinterface.h \
    ../core/qfactoryloader_p.h \
    ../core/qfeatures.h \
    ../core/qfile_p.h \
    ../core/qfile.h \
    ../core/qfiledevice_p.h \
    ../core/qfiledevice.h \
    ../core/qfileinfo_p.h \
    ../core/qfileinfo.h \
    ../core/qfileselector_p.h \
    ../core/qfileselector.h \
    ../core/qfilesystemengine_p.h \
    ../core/qfilesystementry_p.h \
    ../core/qfilesystemiterator_p.h \
    ../core/qfilesystemmetadata_p.h \
    ../core/qfilesystemwatcher_fsevents_p.h \
    ../core/qfilesystemwatcher_inotify_p.h \
    ../core/qfilesystemwatcher_kqueue_p.h \
    ../core/qfilesystemwatcher_p.h \
    ../core/qfilesystemwatcher_polling_p.h \
    ../core/qfilesystemwatcher_win_p.h \
    ../core/qfilesystemwatcher.h \
    ../core/qflags.h \
    ../core/qfreelist_p.h \
    ../core/qfsfileengine_iterator_p.h \
    ../core/qfsfileengine_p.h \
    ../core/qfunctions_p.h \
    ../core/qfuture.h \
    ../core/qfutureinterface_p.h \
    ../core/qfutureinterface.h \
    ../core/qfuturesynchronizer.h \
    ../core/qfuturewatcher_p.h \
    ../core/qfuturewatcher.h \
    ../core/qgenericatomic.h \
    ../core/qglobal.h \
    ../core/qglobalstatic.h \
    ../core/qhash.h \
    ../core/qhashfunctions.h \
    ../core/qhooks_p.h \
    ../core/qiodevice_p.h \
    ../core/qiodevice.h \
    ../core/qipaddress_p.h \
    ../core/qisenum.h \
    ../core/qiterator.h \
    ../core/qjson_p.h \
    ../core/qjsonarray.h \
    ../core/qjsondocument.h \
    ../core/qjsonobject.h \
    ../core/qjsonparser_p.h \
    ../core/qjsonvalue.h \
    ../core/qjsonwriter_p.h \
    ../core/qlatincodec_p.h \
    ../core/qlibrary_p.h \
    ../core/qlibrary.h \
    ../core/qlibraryinfo.h \
    ../core/qline.h \
    ../core/qlinkedlist.h \
    ../core/qlist.h \
    ../core/qlocale_data_p.h \
    ../core/qlocale_p.h \
    ../core/qlocale_tools_p.h \
    ../core/qlocale.h \
    ../core/qlockfile_p.h \
    ../core/qlockfile.h \
    ../core/qlogging.h \
    ../core/qloggingcategory.h \
    ../core/qloggingregistry_p.h \
    ../core/qmachparser_p.h \
    ../core/qmap.h \
    ../core/qmargins.h \
    ../core/qmath.h \
    ../core/qmetaobject_moc_p.h \
    ../core/qmetaobject_p.h \
    ../core/qmetaobject.h \
    ../core/qmetatype_p.h \
    ../core/qmetatype.h \
    ../core/qmetatypeswitcher_p.h \
    ../core/qmutex_p.h \
    ../core/qmutex.h \
    ../core/qmutexpool_p.h \
    ../core/qnamespace.h \
    ../core/qnumeric_p.h \
    ../core/qnumeric.h \
    ../core/qobject_impl.h \
    ../core/qobject_p.h \
    ../core/qobject.h \
    ../core/qobjectdefs_impl.h \
    ../core/qobjectdefs.h \
    ../core/qorderedmutexlocker_p.h \
    ../core/qpair.h \
    ../core/qplatformdefs_bsd.h \
    ../core/qplatformdefs_c89.h \
    ../core/qplatformdefs_cygwin_g++.h \
    ../core/qplatformdefs_darwin_g++.h \
    ../core/qplatformdefs_linux_clang.h \
    ../core/qplatformdefs_linux_g++.h \
    ../core/qplatformdefs_linux_llvm.h \
    ../core/qplatformdefs_mac.h \
    ../core/qplatformdefs_posix.h \
    ../core/qplatformdefs_win32_g++.h \
    ../core/qplatformdefs_win32_msvc.h \
    ../core/qplatformdefs.h \
    ../core/qplugin.h \
    ../core/qpluginloader.h \
    ../core/qpodlist_p.h \
    ../core/qpoint.h \
    ../core/qpointer.h \
    ../core/qprocess_p.h \
    ../core/qprocess.h \
    ../core/qprocessordetection.h \
    ../core/qqueue.h \
    ../core/qreadwritelock_p.h \
    ../core/qreadwritelock.h \
    ../core/qrect.h \
    ../core/qrefcount.h \
    ../core/qregexp.h \
    ../core/qregularexpression.h \
    ../core/qresource_iterator_p.h \
    ../core/qresource_p.h \
    ../core/qresource.h \
    ../core/qresultstore.h \
    ../core/qringbuffer_p.h \
    ../core/qrunnable.h \
    ../core/qsavefile_p.h \
    ../core/qsavefile.h \
    ../core/qscopedpointer_p.h \
    ../core/qscopedpointer.h \
    ../core/qscopedvaluerollback.h \
    ../core/qsemaphore.h \
    ../core/qset.h \
    ../core/qsettings_p.h \
    ../core/qsettings.h \
    ../core/qshareddata.h \
    ../core/qsharedmemory_p.h \
    ../core/qsharedmemory.h \
    ../core/qsharedpointer_impl.h \
    ../core/qsharedpointer.h \
    ../core/qsimd_p.h \
    ../core/qsimplecodec_p.h \
    ../core/qsize.h \
    ../core/qsocketnotifier.h \
    ../core/qstack.h \
    ../core/qstandardpaths.h \
    ../core/qstring.h \
    ../core/qstringalgorithms_p.h \
    ../core/qstringbuilder.h \
    ../core/qstringiterator_p.h \
    ../core/qstringlist.h \
    ../core/qstringmatcher.h \
    ../core/qsysinfo.h \
    ../core/qsystemdetection.h \
    ../core/qsystemerror_p.h \
    ../core/qsystemlibrary_p.h \
    ../core/qsystemsemaphore_p.h \
    ../core/qsystemsemaphore.h \
    ../core/qt_pch.h \
    ../core/qt_windows.h \
    ../core/qtemporarydir.h \
    ../core/qtemporaryfile_p.h \
    ../core/qtemporaryfile.h \
    ../core/qtextcodec_p.h \
    ../core/qtextcodec.h \
    ../core/qtextstream_p.h \
    ../core/qtextstream.h \
    ../core/qthread_p.h \
    ../core/qthread.h \
    ../core/qthreadpool_p.h \
    ../core/qthreadpool.h \
    ../core/qthreadstorage.h \
    ../core/qtimer.h \
    ../core/qtimerinfo_unix_p.h \
    ../core/qtimezone.h \
    ../core/qtimezoneprivate_data_p.h \
    ../core/qtimezoneprivate_p.h \
    ../core/qtldurl_p.h \
    ../core/qtools_p.h \
    ../core/qtranslator_p.h \
    ../core/qtranslator.h \
    ../core/qtypeinfo.h \
    ../core/qtypetraits.h \
    ../core/qunicodetables_p.h \
    ../core/qurl_p.h \
    ../core/qurl.h \
    ../core/qurlquery.h \
    ../core/qurltlds_p.h \
    ../core/qutfcodec_p.h \
    ../core/quuid.h \
    ../core/qvariant_p.h \
    ../core/qvariant.h \
    ../core/qvarlengtharray.h \
    ../core/qvector.h \
    ../core/qversiontagging.h \
    ../core/qwaitcondition.h \
    ../core/qwindowscodec_p.h \
    ../core/qwindowspipereader_p.h \
    ../core/qwindowspipewriter_p.h \
    ../core/qwineventnotifier.h \
    ../core/qxmlstream_p.h \
    ../core/qxmlstream.h \
    ../core/qxmlutils_p.h \
    windows/array.h \
    windows/qtwindows_additional.h \
    windows/qtwindowsglobal.h \
    windows/qwindowsbackingstore.h \
    windows/qwindowsclipboard.h \
    windows/qwindowscontext.h \
    windows/qwindowscursor.h \
    windows/qwindowsdialoghelpers.h \
    windows/qwindowsdrag.h \
    windows/qwindowseglcontext.h \
    windows/qwindowsfontdatabase_ft.h \
    windows/qwindowsfontdatabase.h \
    windows/qwindowsfontengine.h \
    windows/qwindowsfontenginedirectwrite.h \
    windows/qwindowsgdiintegration.h \
    windows/qwindowsgdinativeinterface.h \
    windows/qwindowsglcontext.h \
    windows/qwindowsinputcontext.h \
    windows/qwindowsintegration.h \
    windows/qwindowsinternalmimedata.h \
    windows/qwindowskeymapper.h \
    windows/qwindowsmime.h \
    windows/qwindowsmousehandler.h \
    windows/qwindowsnativeimage.h \
    windows/qwindowsnativeinterface.h \
    windows/qwindowsole.h \
    windows/qwindowsopenglcontext.h \
    windows/qwindowsopengltester.h \
    windows/qwindowsscreen.h \
    windows/qwindowsservices.h \
    windows/qwindowssessionmanager.h \
    windows/qwindowstabletsupport.h \
    windows/qwindowstheme.h \
    windows/qwindowsthreadpoolrunner.h \
    windows/qwindowswindow.h \
    platformsupport/qwindowsguieventdispatcher_p.h \
    cocoa/messages.h \
    cocoa/qcocoaaccessibility.h \
    cocoa/qcocoaaccessibilityelement.h \
    cocoa/qcocoaapplication.h \
    cocoa/qcocoaapplicationdelegate.h \
    cocoa/qcocoabackingstore.h \
    cocoa/qcocoaclipboard.h \
    cocoa/qcocoacolordialoghelper.h \
    cocoa/qcocoacursor.h \
    cocoa/qcocoadrag.h \
    cocoa/qcocoaeventdispatcher.h \
    cocoa/qcocoafiledialoghelper.h \
    cocoa/qcocoafontdialoghelper.h \
    cocoa/qcocoaglcontext.h \
    cocoa/qcocoahelpers.h \
    cocoa/qcocoainputcontext.h \
    cocoa/qcocoaintegration.h \
    cocoa/qcocoaintrospection.h \
    cocoa/qcocoakeymapper.h \
    cocoa/qcocoamenu.h \
    cocoa/qcocoamenubar.h \
    cocoa/qcocoamenuitem.h \
    cocoa/qcocoamenuloader.h \
    cocoa/qcocoamimetypes.h \
    cocoa/qcocoanativeinterface.h \
    cocoa/qcocoaprintdevice.h \
    cocoa/qcocoaprintersupport.h \
    cocoa/qcocoaservices.h \
    cocoa/qcocoasystemsettings.h \
    cocoa/qcocoasystemtrayicon.h \
    cocoa/qcocoatheme.h \
    cocoa/qcocoawindow.h \
    cocoa/qmacclipboard.h \
    cocoa/qmacdefines_mac.h \
    cocoa/qmultitouch_mac_p.h \
    cocoa/qnsview.h \
    cocoa/qnswindowdelegate.h \
    cocoa/qpaintengine_mac_p.h \
    cocoa/qprintengine_mac_p.h \
    cocoa/qt_mac_p.h \
    ../mime/qmimedatabase_p.h \
    ../mime/qmimedatabase.h \
    ../mime/qmimeglobpattern_p.h \
    ../mime/qmimemagicrule_p.h \
    ../mime/qmimemagicrulematcher_p.h \
    ../mime/qmimeprovider_p.h \
    ../mime/qmimetype_p.h \
    ../mime/qmimetype.h \
    ../mime/qmimetypeparser_p.h

SOURCES += \
    qabstracttextdocumentlayout.cpp \
    qbackingstore.cpp \
    qbitmap.cpp \
    qblittable.cpp \
    qbrush.cpp \
    qclipboard.cpp \
    qcompositionfunctions.cpp \
    qcosmeticstroker.cpp \
    qcssparser.cpp \
    qcssscanner.cpp \
    qcssutil.cpp \
    qcursor.cpp \
    qdistancefield.cpp \
    qdnd.cpp \
    qdrag.cpp \
    qemulationpaintengine.cpp \
    qevent.cpp \
    qfont.cpp \
    qfontdatabase.cpp \
    qfontengine_ft.cpp \
    qfontengine_qpf2.cpp \
    qfontengine.cpp \
    qfontengineglyphcache.cpp \
    qfontmetrics.cpp \
    qfontsubset_agl.cpp \
    qfontsubset.cpp \
    qfragmentmap.cpp \
    qgammatables.cpp \
    qgenericplugin.cpp \
    qgenericpluginfactory.cpp \
    qglyphrun.cpp \
    qguiapplication.cpp \
    qguivariant.cpp \
    qharfbuzzng.cpp \
    qhighdpiscaling.cpp \
    qicon.cpp \
    qiconengine.cpp \
    qiconengineplugin.cpp \
    qiconloader.cpp \
    qimagepixmapcleanuphooks.cpp \
    qinputcontrol.cpp \
    qinputdevicemanager.cpp \
    qinputmethod.cpp \
    qkeymapper.cpp \
    qkeysequence.cpp \
    qnativeimage.cpp \
    qoffscreensurface.cpp \
    qoutlinemapper.cpp \
    qpagedpaintdevice.cpp \
    qpagelayout.cpp \
    qpagesize.cpp \
    qpaintdevicewindow.cpp \
    qpaintengine_blitter.cpp \
    qpaintengine_pic.cpp \
    qpaintengine_raster.cpp \
    qpaintengineex.cpp \
    qpainter.cpp \
    qpalette.cpp \
    qpathsimplifier.cpp \
    qpdf.cpp \
    qpdfwriter.cpp \
    qpen.cpp \
    qpicture.cpp \
    qpictureformatplugin.cpp \
    qpixmap_blitter.cpp \
    qpixmap_raster.cpp \
    qpixmap_win.cpp \
    qpixmap.cpp \
    qpixmapcache.cpp \
    qplatformaccessibility.cpp \
    qplatformbackingstore.cpp \
    qplatformclipboard.cpp \
    qplatformcursor.cpp \
    qplatformdialoghelper.cpp \
    qplatformdrag.cpp \
    qplatformfontdatabase.cpp \
    qplatformgraphicsbuffer.cpp \
    qplatformgraphicsbufferhelper.cpp \
    qplatforminputcontext.cpp \
    qplatforminputcontextfactory.cpp \
    qplatforminputcontextplugin.cpp \
    qplatformintegration.cpp \
    qplatformintegrationfactory.cpp \
    qplatformintegrationplugin.cpp \
    qplatformmenu.cpp \
    qplatformnativeinterface.cpp \
    qplatformoffscreensurface.cpp \
    qplatformpixmap.cpp \
    qplatformscreen.cpp \
    qplatformservices.cpp \
    qplatformsessionmanager.cpp \
    qplatformsharedgraphicscache.cpp \
    qplatformsurface.cpp \
    qplatformsystemtrayicon.cpp \
    qplatformtheme.cpp \
    qplatformthemefactory.cpp \
    qplatformthemeplugin.cpp \
    qplatformwindow.cpp \
    qrasterizer.cpp \
    qrasterwindow.cpp \
    qrawfont.cpp \
    qscreen.cpp \
    qsessionmanager.cpp \
    qshapedpixmapdndwindow.cpp \
    qshortcutmap.cpp \
    qsimpledrag.cpp \
    qstatictext.cpp \
    qstylehints.cpp \
    qsurface.cpp \
    qsurfaceformat.cpp \
    qsyntaxhighlighter.cpp \
    qtextcursor.cpp \
    qtextdocument_p.cpp \
    qtextdocument.cpp \
    qtextdocumentfragment.cpp \
    qtextdocumentlayout.cpp \
    qtextdocumentwriter.cpp \
    qtextengine.cpp \
    qtextformat.cpp \
    qtexthtmlparser.cpp \
    qtextimagehandler.cpp \
    qtextlayout.cpp \
    qtextlist.cpp \
    qtextobject.cpp \
    qtextodfwriter.cpp \
    qtextoption.cpp \
    qtexttable.cpp \
    qtextureglyphcache.cpp \
    qtouchdevice.cpp \
    qwindow.cpp \
    qwindowsysteminterface.cpp \
    ../image/qbezier.cpp \
    ../image/qblendfunctions.cpp \
    ../image/qbmphandler.cpp \
    ../image/qcolor_p.cpp \
    ../image/qcolor.cpp \
    ../image/qdrawhelper_avx2.cpp \
    ../image/qdrawhelper_neon.cpp \
    ../image/qdrawhelper_sse2.cpp \
    ../image/qdrawhelper_sse4.cpp \
    ../image/qdrawhelper_ssse3.cpp \
    ../image/qdrawhelper.cpp \
    ../image/qgifhandler.cpp \
    ../image/qimage_avx2.cpp \
    ../image/qimage_compat.cpp \
    ../image/qimage_conversions.cpp \
    ../image/qimage_neon.cpp \
    ../image/qimage_sse2.cpp \
    ../image/qimage_sse4.cpp \
    ../image/qimage_ssse3.cpp \
    ../image/qimage.cpp \
    ../image/qimageiohandler.cpp \
    ../image/qimagereader.cpp \
    ../image/qimagescale_sse4.cpp \
    ../image/qimagescale.cpp \
    ../image/qimagewriter.cpp \
    ../image/qjpeghandler.cpp \
    ../image/qmatrix.cpp \
    ../image/qmemrotate.cpp \
    ../image/qpaintdevice.cpp \
    ../image/qpainterpath.cpp \
    ../image/qpathclipper.cpp \
    ../image/qpixelformat.cpp \
    ../image/qpnghandler.cpp \
    ../image/qpolygon.cpp \
    ../image/qppmhandler.cpp \
    ../image/qregion.cpp \
    ../image/qstroker.cpp \
    ../image/qtransform.cpp \
    ../image/qvectorpath.cpp \
    ../image/qxbmhandler.cpp \
    ../image/qxpmhandler.cpp \
    qmimedata.cpp \
    qvector2d.cpp \
    qharfbuzz.cpp \
    qgenericmatrix.cpp \
    qmatrix4x4.cpp \
    qquaternion.cpp \
    qtextboundaryfinder.cpp \
    qvector3d.cpp \
    qvector4d.cpp \
    qzip.cpp \
    qgrayraster.c \
    xcb/qxcbbackingstore.cpp \
    xcb/qxcbclipboard.cpp \
    xcb/qxcbconnection_xi2.cpp \
    xcb/qxcbconnection.cpp \
    xcb/qxcbcursor.cpp \
    xcb/qxcbdrag.cpp \
    xcb/qxcbglintegration.cpp \
    xcb/qxcbglintegrationfactory.cpp \
    xcb/qxcbimage.cpp \
    xcb/qxcbintegration.cpp \
    xcb/qxcbkeyboard.cpp \
    xcb/qxcbmain.cpp \
    xcb/qxcbmime.cpp \
    xcb/qxcbnativeinterface.cpp \
    xcb/qxcbnativeinterfacehandler.cpp \
    xcb/qxcbscreen.cpp \
    xcb/qxcbsessionmanager.cpp \
    xcb/qxcbsystemtraytracker.cpp \
    xcb/qxcbwindow.cpp \
    xcb/qxcbwmsupport.cpp \
    xcb/qxcbxsettings.cpp \
    platformsupport/qbasicfontdatabase.cpp \
    platformsupport/qgenericunixeventdispatcher.cpp \
    platformsupport/qgenericunixservices.cpp \
    platformsupport/qgenericunixthemes.cpp \
    windows/main.cpp \
    windows/qwindowsbackingstore.cpp \
    windows/qwindowsclipboard.cpp \
    windows/qwindowscontext.cpp \
    windows/qwindowscursor.cpp \
    windows/qwindowsdialoghelpers.cpp \
    windows/qwindowsdrag.cpp \
    windows/qwindowseglcontext.cpp \
    windows/qwindowsfontdatabase_ft.cpp \
    windows/qwindowsfontdatabase.cpp \
    windows/qwindowsfontengine.cpp \
    windows/qwindowsfontenginedirectwrite.cpp \
    windows/qwindowsgdiintegration.cpp \
    windows/qwindowsgdinativeinterface.cpp \
    windows/qwindowsglcontext.cpp \
    windows/qwindowsinputcontext.cpp \
    windows/qwindowsintegration.cpp \
    windows/qwindowsinternalmimedata.cpp \
    windows/qwindowskeymapper.cpp \
    windows/qwindowsmime.cpp \
    windows/qwindowsmousehandler.cpp \
    windows/qwindowsnativeimage.cpp \
    windows/qwindowsnativeinterface.cpp \
    windows/qwindowsole.cpp \
    windows/qwindowsopengltester.cpp \
    windows/qwindowsscreen.cpp \
    windows/qwindowsservices.cpp \
    windows/qwindowssessionmanager.cpp \
    windows/qwindowstabletsupport.cpp \
    windows/qwindowstheme.cpp \
    windows/qwindowswindow.cpp \
    platformsupport/qwindowsguieventdispatcher.cpp \
    cocoa/messages.cpp \
    ../mime/qmimedatabase.cpp \
    ../mime/qmimeglobpattern.cpp \
    ../mime/qmimemagicrule.cpp \
    ../mime/qmimemagicrulematcher.cpp \
    ../mime/qmimeprovider.cpp \
    ../mime/qmimetype.cpp \
    ../mime/qmimetypeparser.cpp

OBJECTIVE_SOURCES += \
    cocoa/main.mm \
    #cocoa/qcocoaaccessibility.mm \
    #cocoa/qcocoaaccessibilityelement.mm \
    cocoa/qcocoaapplication.mm \
    cocoa/qcocoaapplicationdelegate.mm \
    cocoa/qcocoabackingstore.mm \
    cocoa/qcocoaclipboard.mm \
    cocoa/qcocoacolordialoghelper.mm \
    cocoa/qcocoacursor.mm \
    cocoa/qcocoadrag.mm \
    cocoa/qcocoaeventdispatcher.mm \
    cocoa/qcocoafiledialoghelper.mm \
    cocoa/qcocoafontdialoghelper.mm \
    #cocoa/qcocoaglcontext.mm \
    cocoa/qcocoahelpers.mm \
    cocoa/qcocoainputcontext.mm \
    cocoa/qcocoaintegration.mm \
    cocoa/qcocoaintrospection.mm \
    cocoa/qcocoakeymapper.mm \
    cocoa/qcocoamenu.mm \
    cocoa/qcocoamenubar.mm \
    cocoa/qcocoamenuitem.mm \
    cocoa/qcocoamenuloader.mm \
    cocoa/qcocoamimetypes.mm \
    cocoa/qcocoanativeinterface.mm \
    cocoa/qcocoaprintdevice.mm \
    #cocoa/qcocoaprintersupport.mm \
    cocoa/qcocoaservices.mm \
    cocoa/qcocoasystemsettings.mm \
    cocoa/qcocoasystemtrayicon.mm \
    cocoa/qcocoatheme.mm \
    cocoa/qcocoawindow.mm \
    cocoa/qmacclipboard.mm \
    cocoa/qmultitouch_mac.mm \
    cocoa/qnsview.mm \
    #cocoa/qnsviewaccessibility.mm \
    cocoa/qnswindowdelegate.mm \
    cocoa/qpaintengine_mac.mm \
    cocoa/qprintengine_mac.mm


