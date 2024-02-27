#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QIcon>
#include <QProcess>
#include <QDir>
#include <QQmlContext>
//#include <QtSerialPort/QSerialPortInfo>

#include <QTextStream>
#include <QStringListModel>
#include <devicepop.h>
#include <QQmlComponent>
#include <QTimer>
#include <QObject>
#include <QDebug>
#include "SerialCommunication.h"


class Data : public QObject {
    Q_OBJECT

public:
    explicit Data(QObject *parent = nullptr)
        : QObject(parent) {
        // Initialize your member variables if needed
    }

signals:
    void status(QString val1, QString val2,QString val3);

public slots:
    void check() {
        // const auto serialPortInfos = QSerialPortInfo::availablePorts();
        // for (const QSerialPortInfo &portInfo : serialPortInfos) {
        //     port = portInfo.portName();
        //     serialNumber = portInfo.serialNumber();
        //     manufacturer = portInfo.manufacturer();
        //     description = portInfo.manufacturer();
        //     vender = portInfo.vendorIdentifier();
        //     product = portInfo.productIdentifier();
        // }

        // if (serialNumber == "") {
        //     tmStop = "false";
        //     changePopup = "false";
        //     notifyConnect = "DisConnected";
        //     // rectColor = "red";

        // }
        // else {
        //     tmStop = "false";
        //     changePopup = "true";
        //     notifyConnect = "Connected";
        //     // rectColor = "green";
        // }

        // emit status(changePopup, notifyConnect, tmStop);
    }

public:
    QString port;
    QString vender;
    QString product;
    QString description;
    QString manufacturer;
    QString serialNumber;
    QString changePopup;
    QString notifyConnect;
    QString rectColor;
    QString tmStop;
};

class SerialPortInfoViewer : public QObject
{
    Q_OBJECT
public:
    SerialPortInfoViewer(QObject *parent = nullptr) : QObject(parent) {
        updateSerialPortInfo();
    }

    Q_PROPERTY(QList<QVariantMap> serialPortInfoList READ serialPortInfoList NOTIFY serialPortInfoChanged)

signals:
    void serialPortInfoChanged();

public slots:
    QList<QVariantMap> serialPortInfoList() {
        return serialPortInfoList_;
    }

    void updateSerialPortInfo() {
        serialPortInfoList_.clear();
        // const auto serialPortInfos = QSerialPortInfo::availablePorts();

        // for (const QSerialPortInfo &serialPortInfo : serialPortInfos) {
        //     QVariantMap portInfo;
        //     portInfo["portName"] = serialPortInfo.portName();
        //     portInfo["location"] = serialPortInfo.systemLocation();
        //     portInfo["description"] = serialPortInfo.description().isEmpty() ? "N/A" : serialPortInfo.description();
        //     portInfo["manufacturer"] = serialPortInfo.manufacturer().isEmpty() ? "N/A" : serialPortInfo.manufacturer();
        //     portInfo["serialNumber"] = serialPortInfo.serialNumber().isEmpty() ? "N/A" : serialPortInfo.serialNumber();
        //     portInfo["vendorIdentifier"] = serialPortInfo.hasVendorIdentifier() ? QByteArray::number(serialPortInfo.vendorIdentifier(), 16) : "N/A";
        //     portInfo["productIdentifier"] = serialPortInfo.hasProductIdentifier() ? QByteArray::number(serialPortInfo.productIdentifier(), 16) : "N/A";

        //     serialPortInfoList_.append(portInfo);

        //     qDebug() << "Port Name: " << serialPortInfo.portName();
        // }

        // emit serialPortInfoChanged();
    }

private:
    QList<QVariantMap> serialPortInfoList_;
};

class CommandLauncher : public QObject {
    Q_OBJECT

private:
    QString currentDirectory;

signals:
    void commandOutputReady(const QString &output);

public slots:
    void launchCommand(const QString &commands) {
        QProcess process;
        process.setWorkingDirectory(QDir::homePath());

        QString fullcommand;
        if(commands.startsWith("cd ")) {
            fullcommand = commands;
        } else {
            fullcommand = "cd " + currentDirectory + "&& " + commands;
        }

        process.start("/bin/bash", QStringList() << "-c" << fullcommand);
        process.waitForFinished();

        QString output = process.readAllStandardOutput();

        if(commands.startsWith("cd ") && process.exitCode() == 0) {
            QString newDir = commands.mid(3).trimmed();
            if(newDir.startsWith('/')) {
                currentDirectory = newDir;
            } else {
                currentDirectory = QDir::cleanPath(currentDirectory + "/" + newDir);
            }
        }

        emit commandOutputReady(output);
    }
};

#include "main.moc"

int main(int argc, char *argv[]) {
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    QQuickStyle::setStyle("Basic");

    Data data;

    // QTimer timer;
    // timer.setInterval(1000);
    // QObject::connect(&timer, &QTimer::timeout, &data, &Data::check);
    // timer.start();

    // QObject::connect(&data, &Data::status, [](QString val1, QString val2, QString val3) {
    //     qDebug() << "Change Popup: " << val1;
    //     qDebug() << "Notify Connect: " << val2;
    //     qDebug() << "Rect Color: " << val3;
    // });

    qmlRegisterType<Data>("Obj", 1, 0, "Objref");

    SerialPortInfoViewer serialPortInfoViewer;
    engine.rootContext()->setContextProperty("serialPortInfoViewer", &serialPortInfoViewer);

    CommandLauncher launcher;
    engine.rootContext()->setContextProperty("launcher", &launcher);

    //Serial_Port Starting point

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    // Register SerialCommunication class for QML usage
    qmlRegisterType<SerialCommunication>("com.example", 1, 0, "SerialCommunication");

    SerialCommunication serialComm;
    engine.rootContext()->setContextProperty("serialComm", &serialComm);


    const QUrl url(QStringLiteral("qrc:/main.qml"));
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
