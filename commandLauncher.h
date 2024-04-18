#ifndef COMMANDLAUNCHER_H
#define COMMANDLAUNCHER_H

#include <QObject>
#include <QDir>
#include <QProcess>

class CommandLauncher : public QObject
{
    Q_OBJECT

public:
    explicit CommandLauncher(QObject *parent = nullptr);

private:
    QString currentDirectory;

signals:
    void commandOutputReady(const QString &output);

public slots:
    void launchCommand(const QString &commands);
    void windowsPromt(const QString & Windcmmds);
};

#endif // COMMANDLAUNCHER_H
