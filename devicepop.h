#ifndef DEVICEPOP_H
#define DEVICEPOP_H

#include <QObject>

class Devicepop : public QObject {
    Q_OBJECT

public:
    explicit Devicepop(QObject *parent = nullptr);

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

signals:
    void status(QString val1,QString val2, QString val3);

public slots:
    void check();
};

#endif // DEVICEPOP_H
