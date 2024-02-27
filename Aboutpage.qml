import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: windowid
    width: 450
    height: 240
    visible: true
    anchors.centerIn: parent

    Rectangle {
        id:homePage
        anchors.fill: parent
        border.color: "black"
        border.width: 1

        Rectangle {
            width: 450
            height: 25
            color: "#777F8C" // e0e0e0

            Row {
                spacing: 372

                Text {
                    id: txtid
                    text: qsTr(" About")
                    y: 1
                    font.pointSize: 13
                    color: "white"
                }

                Button {
                id: closeid
                width: 25
                height: 25
                x: 570

                    Image {
                        id: close
                        source: "qrc:/Image/Close_red.png"
                        width: 25
                        height: 25
                        anchors.centerIn: closeid
                    }

                    onClicked: {
                        homePage.visible = false
                    }
                }
            }
        }

        Image {
            id: logoid
            source: "qrc:/Image/flash1.png"
            width: 120
            height: 120
            y: 40
            x: 15
        }

        Column {
            spacing: 5
            x: 150
            y: 30

            Label {
                id: textid
                text: "UUU Tool 1.0.0"
                font.pointSize: 13
                font.bold: true
            }
            Label {
                id: text1id
                text: "Built on Nov 15 2023 12:20:33 PM"
                font.pointSize: 13
            }
            Label {
                id: text2id
                text: "Copyright 2023-2024 Airaa Corporates \nLLP. All rights reserved."
                font.pointSize: 13
            }
        }

        Button {
            id: closedid
            text: "Close"
            width: 70
            height: 35
            x: 375
            y: 200

            onClicked: {
                homePage.visible = false
            }
        }
    }
}
