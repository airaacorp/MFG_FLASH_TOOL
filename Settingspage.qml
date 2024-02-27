import QtQuick 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.15

Item {
    id: settid
    width: 640
    height: 470
    visible: true
    anchors.centerIn: parent

    Rectangle {
        id: homeid
        anchors.fill: parent
        border.color: "black"
        border.width: 1

        Rectangle {
            width: 640
            height: 25
            color: "#777f8c"

            Row {
                spacing: 555

                Text {
                    id: txtid
                    text: qsTr(" Setting")
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
                        settid.visible = false
                    }
                }
            }
        }

        GroupBox {
            y: 30
            title: "General Properties "
            font.pointSize: 13
            width: 600
            height: 350
            x: 20

            Column {
                spacing: 13

                Row {
                    spacing: 13
                    y: 13

                    Text {
                        text: "Device Info"
                        font.pointSize: 13
                    }

                    Rectangle {
                        width: 250
                        height: 100
                        border.color: "lightgray"
                        border.width: 1

                        ScrollView {
                            anchors.fill: parent

                            Repeater {
                                model: serialPortInfoViewer ? serialPortInfoViewer.serialPortInfoList : []

                                Text {
                                    anchors.centerIn: parent
                                    textFormat: Text.RichText
                                    text: {
                                        var info = modelData;
                                        return "Port Name: " + info["portName"] +
                                               // "<br>Location: " + info["location"] +
                                               // "<br>Description: " + info["description"] +
                                               // "<br>Manufacturer: " + info["manufacturer"] +
                                               "<br>Serial number: " + info["serialNumber"] +
                                               "<br>Vendor Identifier: " + info["vendorIdentifier"] +
                                               "<br>Product Identifier: " + info["productIdentifier"];
                                    }
                                }
                            }
                        }
                    }
                }

                Label {
                    text: "Options"
                    font.pointSize: 13
                }

                RowLayout {
                    x: 30
                    spacing: 20

                    Text {
                        id: osid
                        text: "OS Flags "
                        font.pointSize: 13
                    }

                    ComboBox {
                        id: _comb
                        visible: true
                        width: 200
                        model: ["Windows", "Linux", "IOS", "Android", "Cloud Based OS"]

                        onCurrentIndexChanged: {
                            if (currentIndex === 4) {
                                _combos.visible = true;
                                _comb.visible = true;
                            } else {
                                _combos.visible = false;
                                _comb.visible = true;
                            }
                        }
                    }

                    ComboBox {
                        id: _combos
                        width: 80
                        visible: false
                        model: ["Netvibes", "CloudMe", "Amoeba", "EyeOS","Ghost OS","OSv","Joli OS","Slap OS","Slive OS","LucidLink OS" ]
                    }
                }

                Button {
                    x: 500
                    // y: 300
                    text: "Reset"
                    width: 80
                    height: 40
                    font.pointSize: 13
                }
            }
        }

        RowLayout {
            x: 310
            y: 410
            spacing: 5

            Button {
                text: "OK"
                width: 100
                height: 30
            }

            Button {
                text: "Apply"
                width: 100
                height: 30
            }

            Button {
                text: "Cancel"
                width: 100
                height: 30
                onClicked: {
                    settid.visible = false
                }
            }
        }

        Connections {
            target: serialPortInfoViewer
            onSerialPortInfoChanged: {
                console.log("Serial port info changed");
            }
        }
    }
}
