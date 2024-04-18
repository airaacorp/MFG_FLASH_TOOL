#include "data.h"

Data::Data(QObject *parent) : QObject{parent} {
    startMonitoring();
}

void Data::startMonitoring() {
    connect(&timer, &QTimer::timeout, this, &Data::check);
    timer.start(1000);
}

void Data::stopMonitoring() {
    timer.stop();
}

void Data::check() {
    bool isConnected = false;
    static bool previousConnectionStatus = false;

    const auto serialPortInfos = QSerialPortInfo::availablePorts();
    for (const QSerialPortInfo &portInfo : serialPortInfos) {
        if (!portInfo.portName().isEmpty()) {
            isConnected = true;
            break;
        }
    }

    if (isConnected != previousConnectionStatus) {
        if (!isConnected) {
            emit status("true", "Disconnected", "red", previousConnectionStatus ? "true" : "false");
        } else {
            emit status("true", "Connected", "green", previousConnectionStatus ? "true" : "false");
        }
        previousConnectionStatus = isConnected;
    }
}
