#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QIcon>
#include <QQmlContext>
#include <QQmlComponent>
#include "serialportinfoviewer.h"
#include "commandLauncher.h"
#include "data.h"
#include "SerialCommunication.h"

int main(int argc, char *argv[]) {
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    QQuickStyle::setStyle("Basic");

    qmlRegisterType<Data>("Obj", 1, 0, "Objref");

    SerialPortInfoViewer serialPortInfoViewer;
    engine.rootContext()->setContextProperty("serialPortInfoViewer", &serialPortInfoViewer);

    CommandLauncher launcher;
    engine.rootContext()->setContextProperty("launcher", &launcher);

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    qmlRegisterType<SerialCommunication>("com.airaacorporates", 1, 0, "SerialCommunication");
    SerialCommunication serialComm;
    engine.rootContext()->setContextProperty("serialComm", &serialComm);

    const QUrl url(QStringLiteral("qrc:/UUU_Tool/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);

    QObject::connect(&launcher, &CommandLauncher::commandOutputReady, [&engine](const QString &output) {
        engine.rootContext()->setContextProperty("commandOutput", output);
    });

    engine.load(url);

    return app.exec();
}
