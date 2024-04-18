#ifndef SERIALPORTINFOVIEWER_H
#define SERIALPORTINFOVIEWER_H

#include <QObject>
#include <QSerialPort>
#include <QVariantMap>

class SerialPortInfoViewer : public QObject
{
    Q_OBJECT
public:
    SerialPortInfoViewer(QObject *parent = nullptr);

    Q_PROPERTY(QList<QVariantMap> serialPortInfoList READ serialPortInfoList NOTIFY serialPortInfoChanged)
    Q_PROPERTY(bool isConnected READ isConnected NOTIFY connectionStateChanged)

signals:
    void serialPortInfoChanged();
    void connectionStateChanged();

public slots:
    QList<QVariantMap> serialPortInfoList() const { return serialPortInfoList_; }
    bool isConnected() const { return connected_; }

    void updateSerialPortInfo();
    void showDeviceInfo(const QString& portName);
    void connectToDevice(const QString& portName);
    void disconnectDevice();
    QString executeCommand(const QString& command);
    QString detectOperatingSystem(const QSerialPortInfo& info);

private:
    QList<QVariantMap> serialPortInfoList_;
    bool connected_;
    QSerialPort* serialPort_;
};

#endif // SERIALPORTINFOVIEWER_H
