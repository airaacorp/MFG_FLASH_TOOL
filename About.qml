import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: windowid
    property real scalefactor : {
        if (Screen.width > 1920) return 1.2
        else if (Screen.height < 1080) return 0.8
        else return 1
    }
    height: parent.height * 0.6
    width: parent.width
    anchors.top: parent.top // Add this line
    anchors.topMargin: 50 // Adjust this value to move the Item down
    visible: true
    signal aboutClosed()

    Rectangle {
        id: homePage
        anchors.fill: parent
        border.color: "#878C92" // "black"
        border.width: 1
        color: "#2B2D2E"
        radius: 8

        Image {
            id: logoid
            source: "qrc:/UUU_Tool/Image/AcL2.png"
            height: parent.height * 0.14
            width: parent.width * 0.5
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: Math.round(0.200 * parent.height)
            anchors.leftMargin: Math.round(0.2500 * parent.width)
        }

        Rectangle {
            id: closerect
            height: width
            width: 35
            anchors.top: parent.top
            anchors.topMargin: 10 // Adjust this value to move the rectangle down
            anchors.right: parent.right
            anchors.rightMargin:6
            color: "#2B2D2E"
            radius: 5

            Text {
                id: closetext
                text: qsTr("X")
                font.pixelSize: 25
                color: "white"
                font.bold: true
                anchors.centerIn: parent
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    closerect.color = "#661B20"
                    closetext.color = "#B48080"
                }
                onExited: {
                    closerect.color = "#2B2D2E"
                    closetext.color = "white"
                }
                onClicked: {
                    closerect.visible = false
                    homePage.visible = false
                }
            }
        }

        Column {
            spacing: 5
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.topMargin: Math.round(0.500 * parent.height)
            anchors.rightMargin: Math.round(0.3000 * parent.width)

            Label {
                id: textid
                text: "UUU Tool 1.0.0"
                color: "white"
                font.family: "Helvetica"
                font.pointSize: homePage.height * 0.035
                font.bold: true
            }
            Label {
                id: text1id
                text: "Built on Nov 15 2023 12:20:33 PM"
                color: "white"
                font.family: "Helvetica"
                font.pointSize: homePage.height * 0.035
            }
            Label {
                id: text2id
                text: "Copyright 2024-2025 Airaa Corporates \nLLP. All rights reserved."
                color: "white"
                font.family: "Helvetica"
                font.pointSize: homePage.height * 0.035
            }
        }

        // Button {
        //     id: closedid
        //     Text {
        //         id: id
        //         text: qsTr("Close")
        //         font.family: "Helvetica"
        //         font.bold: true
        //         color: "white"
        //         font.pointSize: homePage.height * 0.017
        //         anchors.centerIn: parent
        //     }
        //     height: Math.round(60 * scalefactor)
        //     width: Math.round(200 * scalefactor)
        //     background: Rectangle {
        //         radius: 12
        //         color: enabled ? "#8059E8" : "#373B3D"
        //         border.color: "#8059E8"
        //         border.width: 2
        //     }
        //     anchors.bottom: parent.bottom
        //     anchors.bottomMargin: Math.round(0.1 * parent.height)
        //     anchors.right: parent.right
        //     anchors.rightMargin: Math.round(0.4 * parent.width)
        //     onClicked: {
        //         console.log("--Button", closedid.height)
        //         console.log("--BUtton", closedid.width)
        //         homePage.visible = false
        //         windowid.aboutClosed()
        //     }
        // }
    }
}
