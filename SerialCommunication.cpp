#include "SerialCommunication.h"
#include <QProcess>
#include <QFile>
#include <QDir>

SerialCommunication::SerialCommunication(QObject *parent)
    : QObject(parent)
{
    connect(&m_serialPort, &QSerialPort::errorOccurred, [=]() {
        handleError("Serial port error: " + m_serialPort.errorString());
    });
}

SerialCommunication::~SerialCommunication()
{
    closeSerial();
}

void SerialCommunication::connectSerial(const QString &portName, qint32 baudRate)
{
    qDebug() << "Connecting to serial port:" << portName;

    m_serialPort.setPortName(portName);
    m_serialPort.setBaudRate(baudRate);

    if (m_serialPort.open(QIODevice::ReadWrite))
    {
        qDebug() << "Serial port connected successfully.";
    }
    else
    {
        handleError("Failed to connect to serial port: " + m_serialPort.errorString());
    }
}


bool SerialCommunication::isPortConnected()
{
    return m_serialPort.isOpen();
}

void SerialCommunication::closeSerial()
{
    if (m_serialPort.isOpen())
    {
        m_serialPort.close();
        qDebug() << "Serial port closed successfully.";
    }
}

void SerialCommunication::sendData(const QString &data) // Normal Text data sending to target
{
    if (m_serialPort.isOpen()) {
        m_serialPort.write(data.toUtf8());
        m_serialPort.waitForBytesWritten(5000); //5 seconds
    } else {
        qDebug() << "Serial port is not open!";
    }
}

void SerialCommunication::sendFile(const QString &filePath)
{
    QFile file(filePath);
    if (!file.open(QIODevice::ReadOnly)) {
        qDebug() << "Failed to open file: " << file.errorString();
        return;
    }

    QByteArray fileData = file.readAll();
    file.close();

    if (m_serialPort.isOpen()) {
        qint64 bytesWritten = m_serialPort.write(fileData);
        if (bytesWritten == -1) {
            qDebug() << "Failed to write file data: " << m_serialPort.errorString();
        } else {
            qDebug() << "File data successfully sent: " << bytesWritten << "bytes";
            //moveFileToDownloads(filePath);
        }
    } else {
        qDebug() << "Serial port is not open!";
    }
}

void SerialCommunication::handleError(const QString &error)
{
    emit fileTransferFailed(error);
}
