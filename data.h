#ifndef DATA_H
#define DATA_H

#include <QObject>
#include <QTimer>
#include <QSerialPortInfo>

class Data : public QObject
{
    Q_OBJECT

public:
    explicit Data(QObject *parent = nullptr);

    QString changePopup;
    QString notifyConnect;
    QString rectColor;
    QString tmStop;

    void startMonitoring();
    void stopMonitoring();

signals:
    void status(const QString& changePopup, const QString& notifyConnect, const QString& rectColor, const QString& tmStop);

public slots:
    void check();

private:
    QSerialPortInfo serialPortWatcher;
    QTimer timer;
};

#endif // DATA_H
