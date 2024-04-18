#include "commandLauncher.h"

CommandLauncher::CommandLauncher(QObject *parent)
    : QObject(parent)
{}

void CommandLauncher::launchCommand(const QString &commands) {
    QProcess process;
    process.setWorkingDirectory(QDir::homePath());

    QString fullCommand;
    if (commands.startsWith("cd ")) {
        fullCommand = commands;
    } else {
        // Make a non-const copy of the commands string
        QString modifiedCommands = commands;

        // Check if the command starts with sudo
        if (modifiedCommands.startsWith("sudo ")) {
            // Replace sudo with pkexec to handle authorization
            fullCommand = modifiedCommands.replace("sudo ", "pkexec ");
        } else {
            // Regular command without sudo
            fullCommand = "cd " + currentDirectory + " && " + modifiedCommands;
        }
    }

    // Start the process with the full command
    process.start("/bin/bash", QStringList() << "-c" << fullCommand);

    // Wait for the process to finish with a timeout of -1 (indefinite)
    if (!process.waitForFinished(-1)) {
        // Handle error if waitForFinished returns false
        QString error = "Error: " + process.errorString();
        emit commandOutputReady(error);
        return;
    }

    // Read the output and error of the command
    QString output = process.readAllStandardOutput();
    QString errorOutput = process.readAllStandardError();

    // Concatenate output and error output
    QString allOutput = output + "\n" + errorOutput;

    emit commandOutputReady(allOutput);
}

void CommandLauncher::windowsPromt(const QString & Windcmmds) {
    QProcess process;
    process.start("cmd.exe", QStringList() << "/c" << Windcmmds);
    process.waitForFinished();

    QString output = process.readAllStandardOutput();
    emit commandOutputReady(output);
}
