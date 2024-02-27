import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3

Item {
    id: flashcmdid
    width: 800 // 600
    height: width
    visible: true
    anchors.centerIn: parent

    Rectangle {
        id: homeid
        anchors.fill: parent
        border.color: "black"
        border.width: 1

        Rectangle {
            width: 800 // 600
            height: 25
            color: "#777f8c"

            Row {
                spacing: 700 // 500

                Text {
                    id: txtid
                    text: qsTr(" Flash File")
                    x: 5
                    y: 1
                    font.pointSize: 13
                    color: "white"
                }

                Button {
                    id: closeid
                    width: 25
                    height: 25
                    x: 574

                    Image {
                        id: close
                        source: "qrc:/Image/Close_red.png"
                        width: 25
                        height: 25
                        anchors.centerIn: closeid
                    }

                    onClicked: {
                        homeid.visible = false
                    }
                }
            }
        }

        ColumnLayout {
            spacing: 15
            y: 30
            x: 7

            Row {
                spacing: 13

                Label {
                    text: "OS Types: "
                    font.pointSize: 13
                    y: 10
                }

                TextField {
                    id: textfiled
                    width: 300
                    font.pointSize: 13
                }
            }

            Rectangle {
                visible: true
                width: 785 // 585
                height: 700 // 500

                Row {
                    id: rowid
                    spacing: 15

                    TextField {
                        id: commandInput
                        placeholderText: "Enter command..."
                        width: 630 // 430
                    }

                    Button {
                        text: "Launch Command"
                        onClicked: {
                            launcher.launchCommand(commandInput.text);
                        }
                        enabled: commandInput.text.trim().length > 0
                    }
                }

                ScrollView {
                    y: 55
                    width: parent.width
                    height: parent.height - 80

                    TextArea {
                        id: commandOutput
                        width: parent.width
                        height: contentHeight
                        readOnly: true
                        wrapMode: TextEdit.WordWrap
                        anchors.top: parent.top
                        textFormat: TextEdit.PlainText

                        background: Rectangle {
                            color: "black"
                        }

                        color: "white"
                    }
                }

                Connections {
                    target: launcher
                    onCommandOutputReady: {
                        commandOutput.text = output;
                    }
                }
            }
        }
    }
}
