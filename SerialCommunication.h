#ifndef SERIALCOMMUNICATION_H
#define SERIALCOMMUNICATION_H

#include <QObject>
#include <QSerialPort>
#include <QDebug>

class SerialCommunication : public QObject
{
    Q_OBJECT

public:
    explicit SerialCommunication(QObject *parent = nullptr);
    ~SerialCommunication();

    Q_INVOKABLE void connectSerial(const QString &portName, qint32 baudRate);
    Q_INVOKABLE bool isPortConnected();
    Q_INVOKABLE void closeSerial();
    Q_INVOKABLE void sendFile(const QString &filePath);
    Q_INVOKABLE void sendData(const QString &data);
signals:
    void fileTransferCompleted();
    void fileTransferFailed(const QString &error);

private:
         // QSerialPort serialPort;
    QSerialPort m_serialPort;

    void handleError(const QString &error);
};

#endif // SERIALCOMMUNICATION_H
