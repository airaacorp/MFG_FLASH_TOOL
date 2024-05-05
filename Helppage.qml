// import QtQuick 2.15
// import QtQuick.Controls 2.15


// Item {
//     id: item
//     property real scalefactor : {
//         if(Screen.width > 1920) return 1.2
//         else if(Screen.height < 1080) return 0.8
//         else return 1
//     }

//     height:parent.height
//     width: parent.width
//     visible: false
//     implicitWidth: pdfview.visible ? pdfview.width: parent.width
//     implicitHeight: pdfview.visible ? pdfview.height: parent.height




//     Rectangle {
//         id:homePage
//         anchors.fill: parent
//         border.color: "green"
//         border.width: 1

//         Rectangle {
//             id: rect1
//             height: 33
//             width: parent.width
//             color: "#777f8c"

//             Row {
//                 anchors.fill: parent
//                 spacing: 5

//                 Text {
//                     id: txtid
//                     text: qsTr(" Help")
//                     font.family: "Helvetica"
//                     font.pointSize: Screen.height * 0.017
//                     color: "white"
//                     anchors.left: parent.left
//                     leftPadding: 15
//                 }
//                 Rectangle{
//                     id:closerect
//                     height: Math.round(33*scalefactor)

//                     width: Math.round(30*scalefactor)

//                     anchors.right: parent.right
//                     color:"#a9a9a9"

//                     Text {
//                         id: closetext
//                         text: qsTr("X")
//                         font.pixelSize: Screen.height *0.025
//                         color: "white"
//                         font.bold: true
//                         anchors.centerIn: parent
//                     }
//                     MouseArea{

//                         anchors.fill: parent
//                         hoverEnabled: true
//                         onEntered: closerect.color="#777f8c"
//                         onExited: closerect.color="#a9a9a9"
//                         onClicked: {
//                             homePage.visible = false
//                             closerect.visible=flase
//                         }
//                     }

//                 }

//                 // Button {
//                 //     id: closeid
//                 //     height: Math.round(33*scalefactor)
//                 //     width: Math.round(30*scalefactor)
//                 //     anchors.right: parent.right
//                 //     Image {
//                 //         id: close
//                 //         source: "qrc:/Image/Close_red.png"
//                 //         height: Math.round(33*scalefactor)
//                 //         width: Math.round(30*scalefactor)
//                 //         anchors.centerIn: parent
//                 //     }

//                 //     onClicked: {
//                 //         homePage.visible = false
//                 //     }
//                 // }
//             }
//         }

//         Rectangle {
//             id: textrect
//             width: parent.width
//             height: t1.height
//             anchors.top: rect1.bottom
//             anchors.topMargin: rect1.height

//             color: mouseArea.containsMouse ? "#cdcdcd" : "transparent"

//             MouseArea {
//                 id: mouseArea
//                 anchors.fill: parent
//                 hoverEnabled: true

//                 onClicked: {
//                     homePage.visible=false;
//                     pdfview.visible=true;
//                 }
//             }

//             Text {
//                 id: t1
//                 text: qsTr("User Guidelines")
//                 font.family: "Helvetica"
//                 anchors.centerIn: parent
//                 font.bold: t1
//                 font.pointSize: Screen.height * 0.017
//             }
//         }

//         Rectangle {
//             id: textrect1
//             width: parent.width
//             height: t2.height
//             anchors.top: textrect.bottom
//             anchors.topMargin: textrect.height

//             color: mouseArea1.containsMouse ? "#cdcdcd" : "transparent"

//             MouseArea {
//                 id: mouseArea1
//                 anchors.fill: parent
//                 hoverEnabled: true

//                 onClicked: {
//                     homePage.visible=false;
//                     aboutview.visible=true

//                 }
//             }

//             Text {
//                 id: t2
//                 text: qsTr("About")
//                 font.family: "Helvetica"
//                 anchors.centerIn: parent
//                 font.bold: t2
//                 font.pointSize: Screen.height * 0.017
//             }
//         }
//     }



//     Rectangle {
//         id: pdfview
//         visible: false;
//         width: parent.width
//         height: parent.height
//         anchors.centerIn: parent
//         anchors.topMargin: 50 // Adjust the top margin as needed

//         Flickable {
//             anchors.fill: parent
//             contentHeight: columnRects.height
//             clip: true
//             flickableDirection: Flickable.VerticalFlick

//             Column {
//                 id: columnRects
//                 width: parent.width
//                 spacing: 20
//                 anchors.horizontalCenter: parent.horizontalCenter

//                 Image {
//                     id: i1
//                     source: "qrc:/Image/1.png"
//                     width: columnRects.width
//                     horizontalAlignment: Qt.AlignHCenter
//                 }
//                 Image {
//                     id: i2
//                     source: "qrc:/Image/2.png"
//                     width: columnRects.width
//                     horizontalAlignment: Qt.AlignHCenter
//                 }
//                 Image {
//                     id: i3
//                     source: "qrc:/Image/3.png"
//                     width: columnRects.width
//                     horizontalAlignment: Qt.AlignHCenter
//                 }
//             }
//         }
//         Rectangle{
//             id:closerect1
//             height: Math.round(33*scalefactor)

//             width: Math.round(30*scalefactor)

//             anchors.right: parent.right
//             color:"#a9a9a9"

//             Text {
//                 id: closetext1
//                 text: qsTr("X")
//                 font.pixelSize: 25
//                 color: "white"
//                 font.bold: true
//                 anchors.centerIn: parent
//             }
//             MouseArea{

//                 anchors.fill: parent
//                 hoverEnabled: true
//                 onEntered: closerect1.color="#777f8c"
//                 onExited: closerect1.color="#a9a9a9"
//                 onClicked: {
//                     pdfview.visible = false
//                     homePage.visible=true
//                 }
//             }

//             // Button {
//             //     id: pdfcloseid
//             //     width: 30
//             //     height: 30
//             //     anchors.right: parent.right
//             //     anchors.top: parent.top

//             //     Image {
//             //         id: pdfclose
//             //         source: "qrc:/Image/Close_red.png"
//             //         width: 30
//             //         height: 30
//             //         anchors.centerIn: parent
//             //     }

//             //     onClicked: {
//             //         pdfview.visible = false
//             //         console.log("Closed")
//             //     }
//             // }
//         }
//     }
//     Rectangle {
//         id: aboutview
//         visible: false;
//         width: parent.width
//         height: parent.height
//         anchors.centerIn: parent
//         anchors.topMargin: 50 // Adjust the top margin as needed

//         Image {
//             id: logoid
//             source: "qrc:/Image/flash1.png"
//             height: 200/1080 * parent.height
//             // width: 150/1920 * parent.width
//             width: height
//             anchors.top: parent.top
//             anchors.left: parent.left
//             anchors.topMargin: Math.round(0.375 * parent.height)
//             anchors.leftMargin: Math.round(0.1700 * parent.width)
//         }

//         Column {
//             spacing: 5
//             anchors.top: parent.top
//             anchors.right: parent.right
//             anchors.topMargin: Math.round(0.400 * parent.height)
//             anchors.rightMargin: Math.round(0.1700 * parent.width)

//             Label {
//                 id: textid
//                 text: "UUU Tool 1.0.0"
//                 font.family: "Helvetica"
//                 font.pointSize: homePage.height * 0.017
//                 font.bold: true
//             }
//             Label {
//                 id: text1id
//                 text: "Built on Nov 15 2023 12:20:33 PM"
//                 font.family: "Helvetica"
//                 font.pointSize: homePage.height * 0.017

//             }
//             Label {
//                 id: text2id
//                 text: "Copyright 2024-2025 Airaa Corporates \nLLP. All rights reserved."
//                 font.family: "Helvetica"
//                 font.pointSize: homePage.height * 0.017

//             }
//         }

//         Rectangle{
//             id:closerect2
//             height: Math.round(33*scalefactor)

//             width: Math.round(30*scalefactor)

//             anchors.right: parent.right
//             color:"#a9a9a9"

//             Text {
//                 id: closetext2
//                 text: qsTr("X")
//                 font.pixelSize: 25
//                 color: "white"
//                 font.bold: true
//                 anchors.centerIn: parent
//             }
//             MouseArea{

//                 anchors.fill: parent
//                 hoverEnabled: true
//                 onEntered: closerect2.color="#777f8c"
//                 onExited: closerect2.color="#a9a9a9"
//                 onClicked: {
//                     aboutview.visible = false
//                     homePage.visible = false
//                 }
//             }

//             // Button {
//             //     id: pdfcloseid
//             //     width: 30
//             //     height: 30
//             //     anchors.right: parent.right
//             //     anchors.top: parent.top

//             //     Image {
//             //         id: pdfclose
//             //         source: "qrc:/Image/Close_red.png"
//             //         width: 30
//             //         height: 30
//             //         anchors.centerIn: parent
//             //     }

//             //     onClicked: {
//             //         pdfview.visible = false
//             //         console.log("Closed")
//             //     }
//             // }
//         }
//     }
// }
