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
    webdriver/response.h \
    third_party/jsoncpp/json/json.h \
    third_party/jsoncpp/json/json-forwards.h \
    third_party/mongoose/mongoose.h
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
    webdriver/response.cpp \
    third_party/jsoncpp/jsoncpp.cpp \
    third_party/mongoose/mongoose.c

OTHER_FILES = bootstrap.js

include(gif/gif.pri)

win32: RC_FILE = phantomjs_win.rc
os2:   RC_FILE = phantomjs_os2.rc

mac {
    CONFIG -= app_bundle
# Uncomment to build a Mac OS X Universal Binary (i.e. x86 + ppc)
#    CONFIG += x86 ppc
}

#unix:!symbian|win32: LIBS += -L$$PWD/third_party/mongoose -lmongoose

INCLUDEPATH += $$PWD/third_party/mongoose \
               $$PWD/third_party/jsoncpp \
               $$PWD/third_party/jsoncpp/json \
DEPENDPATH += $$PWD/third_party/mongoose \
              $$PWD/third_party/jsoncpp \
              $$PWD/third_party/jsoncpp/json

win32: LIBS += -lws2_32
