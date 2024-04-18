#include "serialportinfoviewer.h"
#include <QSerialPortInfo>
#include <QProcess>
#include <QFile>

QString SerialPortInfoViewer::executeCommand(const QString& command)
{
    QProcess process;
    process.start(command);
    process.waitForFinished();
    return QString(process.readAllStandardOutput());
}

SerialPortInfoViewer::SerialPortInfoViewer(QObject *parent)
    : QObject(parent), connected_(false), serialPort_(new QSerialPort(this))
{
    updateSerialPortInfo();
}

void SerialPortInfoViewer::updateSerialPortInfo()
{
    serialPortInfoList_.clear();
    const auto serialPortInfos = QSerialPortInfo::availablePorts();

    for (const QSerialPortInfo &serialPortInfo : serialPortInfos) {
        QVariantMap portInfo;
        portInfo["portName"] = serialPortInfo.portName();
        portInfo["location"] = serialPortInfo.systemLocation();
        portInfo["description"] = serialPortInfo.description().isEmpty() ? "N/A" : serialPortInfo.description();
        portInfo["manufacturer"] = serialPortInfo.manufacturer().isEmpty() ? "N/A" : serialPortInfo.manufacturer();
        portInfo["serialNumber"] = serialPortInfo.serialNumber().isEmpty() ? "N/A" : serialPortInfo.serialNumber();
        portInfo["vendorIdentifier"] = serialPortInfo.hasVendorIdentifier() ? QByteArray::number(serialPortInfo.vendorIdentifier(), 16) : "N/A";
        portInfo["productIdentifier"] = serialPortInfo.hasProductIdentifier() ? QByteArray::number(serialPortInfo.productIdentifier(), 16) : "N/A";

        serialPortInfoList_.append(portInfo);
    }

    emit serialPortInfoChanged();
}

void SerialPortInfoViewer::showDeviceInfo(const QString& portName)
{
    QSerialPortInfo connectedDeviceInfo(portName);

    QVariantMap deviceInfo;
    deviceInfo["portName"] = connectedDeviceInfo.portName();
    deviceInfo["location"] = connectedDeviceInfo.systemLocation();
    deviceInfo["description"] = connectedDeviceInfo.description().isEmpty() ? "N/A" : connectedDeviceInfo.description();
    deviceInfo["manufacturer"] = connectedDeviceInfo.manufacturer().isEmpty() ? "N/A" : connectedDeviceInfo.manufacturer();
    deviceInfo["serialNumber"] = connectedDeviceInfo.serialNumber().isEmpty() ? "N/A" : connectedDeviceInfo.serialNumber();
    deviceInfo["vendorIdentifier"] = connectedDeviceInfo.hasVendorIdentifier() ? QByteArray::number(connectedDeviceInfo.vendorIdentifier(), 16) : "N/A";
    deviceInfo["productIdentifier"] = connectedDeviceInfo.hasProductIdentifier() ? QByteArray::number(connectedDeviceInfo.productIdentifier(), 16) : "N/A";

    // Determine the operating system based on the vendor and product identifiers
    if (connectedDeviceInfo.hasVendorIdentifier() && connectedDeviceInfo.hasProductIdentifier()) {
        QString detectedOS = detectOperatingSystem(connectedDeviceInfo);
        deviceInfo["os"] = detectedOS;
        qDebug() << "Detected OS:" << detectedOS;
    } else {
        deviceInfo["os"] = "Unknown";
    }

    serialPortInfoList_.clear();
    serialPortInfoList_.append(deviceInfo);

    connected_ = true;
    emit connectionStateChanged();
    emit serialPortInfoChanged();
}

void SerialPortInfoViewer::connectToDevice(const QString& portName)
{
    connected_ = true;
    emit connectionStateChanged();
}

void SerialPortInfoViewer::disconnectDevice()
{
    connected_ = false;
    emit connectionStateChanged();
}

QString SerialPortInfoViewer::detectOperatingSystem(const QSerialPortInfo& info)
{
    qDebug() << "Vendor Identifier:" << info.vendorIdentifier();
    qDebug() << "Product Identifier:" << info.productIdentifier();

    //Windows devices
    if (info.vendorIdentifier() == 0x67B && info.productIdentifier() == 0x2303) {
        return "Windows";
    }

    // Linux devices
    if (info.vendorIdentifier() == 0x1234 && info.productIdentifier() == 0xABCD) {
        return "Linux";
    }

    //other operating systems MAC OS, ANDROID
    return "Unknown";
}

