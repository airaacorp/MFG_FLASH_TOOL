import QtQuick 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.15

Item {
    id: settid

    property real scalefactor : {
        if(Screen.width > 1920) return 1.2
        else if(Screen.height < 1080) return 0.8
        else return 1
    }
    height: parent.height
    width: parent.width
    visible: true

    property var previousSerialPortInfoList: []  //to store the data

    function clearData() {
        serialPortInfoViewer.clearData();
    }

    function openTerminalBasedOnOS() {
        var selectedOS = _comb.currentText;
        console.log("Selected OS: " + selectedOS);

        if (selectedOS === "Windows") {
            terminalController.openTerminal("Windows");
        } else if (selectedOS === "Linux") {
            terminalController.openTerminal("Linux");
        }
    }

    Rectangle {
        id: homeid
        anchors.fill: parent
        border.color: "black"
        border.width: 1

        Rectangle {
            id:one
            height: Math.round(33*scalefactor)
            width: parent.width
            visible: true
            color: "#777f8c"

            Row {
                anchors.fill: parent
                Text {
                    id: txtid
                    text: qsTr(" Setting")
                    font.family: "Helvetica"
                    font.pointSize: Screen.height * 0.017
                    color: "#FFFFFF"
                    leftPadding: 15
                }
                Rectangle{

                    id:closerect
                    height: Math.round(33*scalefactor)

                    width: Math.round(30*scalefactor)

                    color:"#a9a9a9"
                    anchors.right: parent.right

                    Text {
                        id: closetext
                        text: qsTr("X")
                        font.pixelSize: 25
                        color: "white"
                        font.bold: true
                        anchors.centerIn: parent
                    }
                    MouseArea{

                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: closerect.color="#777f8c"
                        onExited: closerect.color="#a9a9a9"
                        onClicked: {
                            settid.visible = false
                            closerect.visible=flase
                        }
                    }
                }


                // Button {
                //     id: closeid
                //     height: Math.round(33*scalefactor)
                //     width: Math.round(30*scalefactor)
                //     anchors.right: parent.right

                //     Image {
                //         id: close
                //         source: "qrc:/Image/Close_red.png"
                //         height: Math.round(33*scalefactor)
                //         width: Math.round(30*scalefactor)
                //         anchors.fill: parent
                //     }
                //     onClicked: {
                //         settid.visible = false
                //     }
                // }
            }
        }

        Text {
            anchors {
                top: one.bottom
                left: parent.left
                topMargin: Math.round(35 * scalefactor)
                leftMargin: Math.round(20 * scalefactor)
            }
            id: deviceInfoRect
            text: qsTr("Auto Scripts")
            font.pointSize: Screen.height * 0.017
            font.family: "Helvetica"
        }
        Rectangle {
            // height: Math.round(520*scalefactor)
            // width: Math.round(760*scalefactor)
            height: 0.600*parent.height
            width: 0.950*parent.width
            anchors {
                left: parent.left
                leftMargin: Math.round(20 * scalefactor)
                top: deviceInfoRect.bottom
                topMargin: Math.round(20 * scalefactor)
            }
            border.color: "black"
            Repeater {
                model: serialPortInfoViewer ? serialPortInfoViewer.serialPortInfoList : []
                MouseArea {

                    anchors.fill: parent
                    onClicked: {
                        serialPortInfoViewer.showDeviceInfo(modelData["portName"]);
                    }
                    Text {
                        anchors.right: parent.right
                        textFormat: Text.RichText
                        font.pointSize: Screen.height * 0.017
                        font.family: "Helvetica"
                        text: {
                            var info = modelData;
                            var serialNumber = info["serialNumber"] || "Not Available";
                            return "Port Name: " + info["portName"] +
                                    "<br>Operating System: " + serialPortInfoViewer.serialPortInfoList[0].os +
                                    "<br>Location: " + info["location"] +
                                    "<br>Description: " + info["description"] +
                                    "<br>Manufacturer: " + info["manufacturer"] +
                                    "<br>Serial number: " + serialNumber +
                                    "<br>Vendor Identifier: " + info["vendorIdentifier"] +
                                    "<br>Product Identifier: " + info["productIdentifier"];
                        }
                    }
                }
            }
        }

        Row {
            spacing: 20
            anchors {
                bottom: parent.bottom
                bottomMargin: Math.round(40 * scalefactor)
                horizontalCenter: parent.horizontalCenter
            }

            Button {
                id: okButton
                Text {
                    text:"OK"
                    font.family: "Helvetica"
                    font.pointSize: Screen.height * 0.015
                    font.bold: true
                    color: "white"
                    anchors.centerIn: parent
                }
                height: Math.round(60*scalefactor)
                width: Math.round(200*scalefactor)
                background: Rectangle{
                    radius: 60
                    color: "#777f8c"
                }
                onClicked: {
                }
            }

            // Button {
            //     text: "Cancel"
            //     font.family: "Helvetica"
            //     font.bold: true
            //     font.pointSize: Screen.height * 0.017
            //     height: Math.round(60*scalefactor)
            //     width: Math.round(260*scalefactor)
            //     onClicked: {
            //         settid.visible = false;
            //     }
            // }
        }
        Connections {
            target: serialPortInfoViewer
            onSerialPortInfoChanged: {
                // Check if the data has changed before updating the UI
                if (serialPortInfoViewer.serialPortInfoList !== previousSerialPortInfoList) {
                    console.log("Serial port info changed");
                    // Update UI or emit signals here
                    previousSerialPortInfoList = serialPortInfoViewer.serialPortInfoList;
                }
            }
            onConnectionStateChanged: {
                //connection state changes here
                if (serialPortInfoViewer.isConnected) {
                    console.log("Device connected");
                } else {
                    console.log("Device disconnected");
                }
            }
        }
    }
}
