import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: windowid
    property real scalefactor : {
        if(Screen.width > 1920) return 1.2
        else if(Screen.height < 1080) return 0.8
        else return 1
    }
    height: parent.height
    width: parent.width
    visible: true
    signal aboutClosed()

    Rectangle {
        id:homePage
        anchors.fill: parent
        border.color: "#878C92"//"black"
        border.width: 1
        color: "#373B3D"
        radius: 8


        Image {
            id: logoid
            source: "qrc:/UUU_Tool/Image/flash1.png"
            height: 200/1080 * parent.height
            // width: 150/1920 * parent.width
            width: height
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: Math.round(0.375 * parent.height)
            anchors.leftMargin: Math.round(0.1700 * parent.width)
        }

        Column {
            spacing: 5
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.topMargin: Math.round(0.400 * parent.height)
            anchors.rightMargin: Math.round(0.1700 * parent.width)

            Label {
                id: textid
                text: "UUU Tool 1.0.0"
                color: "white"
                font.family: "Helvetica"
                font.pointSize: homePage.height * 0.017
                font.bold: true
            }
            Label {
                id: text1id
                text: "Built on Nov 15 2023 12:20:33 PM"
                color: "white"
                font.family: "Helvetica"
                font.pointSize: homePage.height * 0.017

            }
            Label {
                id: text2id
                text: "Copyright 2024-2025 Airaa Corporates \nLLP. All rights reserved."
                color: "white"
                font.family: "Helvetica"
                font.pointSize: homePage.height * 0.017

            }
        }
        Button {
            id: closedid
            Text {
                id: id
                text: qsTr("Close")
                font.family: "Helvetica"
                font.bold: true
                color: "white"
                font.pointSize: homePage.height * 0.017
                anchors.centerIn: parent
            }
            height: Math.round(60*scalefactor)
            width: Math.round(200*scalefactor)
            background: Rectangle{
                radius: 12
                color: enabled?  "#8059E8" : "#373B3D"
                border.color:  "#8059E8"
                border.width: 2
            }

            anchors.bottom: parent.bottom
            anchors.bottomMargin: Math.round(0.1 * parent.height)
            anchors.right: parent.right
            anchors.rightMargin: Math.round(0.4 * parent.width)
            onClicked: {
                console.log("--Button",closedid.height)
                console.log("--BUtton",closedid.width)
                homePage.visible = false
                windowid.aboutClosed()
            }
        }
    }
}
