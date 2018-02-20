TEMPLATE = app
TARGET = qmlsnapshotexample

macos:CONFIG -= app_bundle
CONFIG += c++11

QT += quick printsupport

QMAKE_RPATHDIR += $$OUT_PWD/../3rdParty/qmlsnapshot
INCLUDEPATH += $$PWD/../3rdParty/qmlsnapshot
LIBS += -L$$OUT_PWD/../3rdParty/qmlsnapshot -lqmlsnapshot

SOURCES += \
           main.cpp

target.path = $$OUT_PWD/../qmlsnapshotexample
INSTALLS += target

assets.files = $$PWD/../assets
assets.path = $$OUT_PWD/../
INSTALLS += assets

mesh.files = $$PWD/../mesh
mesh.path = $$OUT_PWD/../
INSTALLS += mesh
