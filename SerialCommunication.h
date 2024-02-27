// SerialCommunication.h
#ifndef SERIALCOMMUNICATION_H
#define SERIALCOMMUNICATION_H

#include <QObject>
#include <QSerialPort>

class SerialCommunication : public QObject
{
    Q_OBJECT

public:
    explicit SerialCommunication(QObject *parent = nullptr);
    ~SerialCommunication();

    Q_INVOKABLE void connectSerial(const QString &portName, qint32 baudRate);
    Q_INVOKABLE void sendData(const QString &data);
    Q_INVOKABLE QString receiveData();
    Q_INVOKABLE void closeSerial();

private:
    QSerialPort serialPort;
};

#endif // SERIALCOMMUNICATION_H
