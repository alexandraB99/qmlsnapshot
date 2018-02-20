TEMPLATE = subdirs
CONFIG += ordered
SUBDIRS += 3rdParty/qmlsnapshot
SUBDIRS += src

qml.files = main.qml Content3D.qml
qml.path = $$OUT_PWD
INSTALLS += qml

OTHER_FILES += $$files($$PWD/*.qml, true)
