#include "SerialCommunication.h"
#include <QDebug>

SerialCommunication::SerialCommunication(QObject *parent)
    : QObject(parent)
{
}

SerialCommunication::~SerialCommunication()
{
    closeSerial();
}

void SerialCommunication::connectSerial(const QString &portName, qint32 baudRate)
{

    qDebug() << "Connecting to serial port:" << portName;

    serialPort.setPortName(portName);
    serialPort.setBaudRate(baudRate);

    if (serialPort.open(QIODevice::ReadWrite))
    {
        // Connection successful
        qDebug() << "Serial port connected.";
    }
    else
    {
        // Connection failed
        qDebug() << "Failed to connect to serial port. Error:" << serialPort.errorString();
    }
}


void SerialCommunication::sendData(const QString &data)
{
    if (serialPort.isOpen())
    {
        serialPort.write(data.toUtf8());
    }
    else
    {
        qDebug() << "Serial port is not open. Cannot send data.";
    }
}


QString SerialCommunication::receiveData()
{
    return serialPort.readAll();
}

void SerialCommunication::closeSerial()
{
    if (serialPort.isOpen())
    {

        qDebug() << "Closing serial port:" << serialPort.portName();

        serialPort.close();

        if (serialPort.isOpen())
        {
            qDebug() << "Failed to close serial port:" << serialPort.portName();
        }
        else
        {
            qDebug() << "Serial port closed successfully.";
        }
    }
    else
    {
        qDebug() << "Serial port is not open.";
    }
}

