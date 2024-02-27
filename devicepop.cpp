#include "devicepop.h"
#include <QtSerialPort/QSerialPortInfo>
#include <QTextStream>
#include<qdebug.h>

Devicepop::Devicepop(QObject *parent) : QObject{parent} {
}

void Devicepop::check() {
    const auto serialPortInfos = QSerialPortInfo::availablePorts();
    for (const QSerialPortInfo &portInfo : serialPortInfos) {
        port=portInfo.portName();
        serialNumber=portInfo.serialNumber();
        manufacturer=portInfo.manufacturer();
        description=portInfo.manufacturer();
        vender=portInfo.vendorIdentifier();
        product=portInfo.productIdentifier();
    }
    if (serialNumber  == "" ) {
        changePopup="false";
        notifyConnect="DisConnected";
        rectColor="red";
        tmStop="true";

    } else {
        changePopup="true";
        notifyConnect="Connected";
        rectColor="green";
        tmStop="false";
    }

    emit status(changePopup,notifyConnect,rectColor);
}
