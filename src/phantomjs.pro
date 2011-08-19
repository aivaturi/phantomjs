TEMPLATE = app
TARGET = phantomjs
QT += network webkit
CONFIG += console

# Comment to enable Debug Messages
DEFINES += QT_NO_DEBUG_OUTPUT

DESTDIR = ../bin

RESOURCES = phantomjs.qrc

HEADERS += csconverter.h \
    phantom.h \
    webpage.h \
    consts.h \
    utils.h \
    networkreplyproxy.h \
    networkaccessmanager.h \
    cookiejar.h \
    filesystem.h \
    terminal.h \
    registry.h \
    encoding.h \
    webdriver/server.h \
    webdriver/response.h
SOURCES += phantom.cpp \
    webpage.cpp \
    main.cpp \
    csconverter.cpp \
    utils.cpp \
    networkreplyproxy.cpp \
    networkaccessmanager.cpp \
    cookiejar.cpp \
    filesystem.cpp \
    terminal.cpp \
    registry.cpp \
    encoding.cpp \
    webdriver/server.cpp \
    webdriver/response.cpp

OTHER_FILES = bootstrap.js

include(gif/gif.pri)

win32: RC_FILE = phantomjs_win.rc
os2:   RC_FILE = phantomjs_os2.rc

mac {
    CONFIG -= app_bundle
# Uncomment to build a Mac OS X Universal Binary (i.e. x86 + ppc)
#    CONFIG += x86 ppc
}

unix:!symbian|win32: LIBS += -L$$PWD/third_party/mongoose/ -lmongoose -L$$PWD/third_party/json/ -ljson_mingw_libmt

INCLUDEPATH += $$PWD/third_party/mongoose \
               $$PWD/third_party/json
DEPENDPATH += $$PWD/third_party/mongoose \
              $$PWD/third_party/json


















