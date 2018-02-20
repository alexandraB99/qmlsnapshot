#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <qmlsnapshot.h>
#include <standardpaths.h>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QMLSnapShot qmlSnapShot;
    StandardPaths standardPaths;

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("QMLSnapShot", &qmlSnapShot);
    engine.rootContext()->setContextProperty("StandardPaths", &standardPaths);
    engine.load(QUrl(QStringLiteral("main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
