import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Dialogs
//import Obj 1.0

ApplicationWindow {
    id: windowid
    title: " UUU Tool"
    visible: true    
    // width: 1920 // 1020
    // height: 1080 // 780

    width: Screen.width * 2
    height: Screen.height * 3

    flags: Qt.Window | Qt.FramelessWindowHint

    Rectangle {
        id: _rect
        color: "red"
        anchors.fill: parent

        gradient: Gradient {
            GradientStop { position: 0.0; color: "#5bccf6" }
            GradientStop { position: 1.0; color: "white" }
        }

        Image {
            id: _image
            source: "qrc:/Image/Airaa_Logo.png"
            x: (_rect.width / 2) - width / 2
            height: Screen.height * 0.1 //80
            width: Screen.width * 0.2 //200
            anchors.bottom: _text.top
        }

        Text {
            id: _text
            text: qsTr("MFG FLASH TOOL")
            anchors.centerIn: parent
            font.bold: true
            font.pointSize: Screen.height * 0.04 //50
        }

        Timer {
            interval: 5000 // 5 seconds (in milliseconds)
            running: true
            repeat: false
            onTriggered: {
                _rect.visible = false; // Hide the Rectangle
                mainwindid.visible = true;
            }
        }

        MouseArea {
            anchors.fill:parent
            onClicked: {
                mainwindid.visible = true
                _rect.visible = false
            }
        }
    }

    Item {
        id: mainwindid
        anchors.fill: parent
        visible: false

        Rectangle {
            id: titlebarid
            width: Screen.width * 2
            height: Screen.height * 3
            color: "#F0F0F0"

            Image {
                id: logoid
                source: "qrc:/Image/flash1.png"
                width: Screen.width * 0.015 // 25
                height: Screen.height * 0.02  // 25
                x: Screen.width * 0.004 // 5
                y: Screen.height * 0.004
            }

            Label {
                id: titleid
                text: "UUU Flash Tool"
                font.pointSize: Screen.height * 0.01 // 10
                x: Screen.width * 0.025 // 40
                y: Screen.height * 0.004 // 5
            }

            Row {
                x: 1800//Screen.width * 0.2 // 1740
                spacing: Screen.width * 0.01 //15
               // anchors.leftMargin: 500

                Button {
                    id: miniid
                    width: 25
                    height: 30
                    background: Rectangle {
                        color: "#F0F0F0"
                    }

                    Image {
                        source: "qrc:/Image/minid.png"
                        width: 25
                        height: 30
                        anchors.centerIn: miniid
                    }

                    onClicked: {
                        windowid.showMinimized()
                    }
                }

                Button {
                    id: maxid
                    width: 25
                    height: 30
                    background: Rectangle {
                        color: "#F0F0F0"
                    }

                    Image {
                        source: "qrc:/Image/maxid.png"
                        width: 18
                        height: 18
                        anchors.centerIn: maxid
                    }

                    onClicked: {
                        windowid.showMaximized()
                    }
                }

                Button {
                    id: closeid
                    width: 25
                    height: 30
                    background: Rectangle {
                        color: "#F0F0F0"
                    }

                    Image {
                        source: "qrc:/Image/closeid.png"
                        width: 20
                        height: 20
                        anchors.centerIn: closeid
                    }

                    onClicked: {
                        confirmationDialog.open()
                    }

                    Dialog {
                        id: confirmationDialogid
                        width: 300
                        height: 150

                        x: (parent.width - width) / 2
                        y: (parent.height - height) / 2
                        parent: Overlay.overlay

                        modal: true
                        title: "Closing Application"
                        standardButtons: Dialog.Ok | Dialog.Cancel

                        onAccepted: {
                            Qt.quit()
                        }

                        onRejected: {
                            confirmationDialogid.close()
                        }

                        Row {
                            spacing: 10
                            Image {
                                id: questmark1id
                                source: "qrc:/Image/QuestionMark.png"
                                width: 30
                                height: 30
                            }

                            Label {
                                text: "Are you sure?"
                            }
                        }
                    }
                }
            }
        }

        Rectangle {
            id: homepageid
            y: Screen.height * 0.04 // 40
            color: "#000064"
            // width: 1980
            // height: 1050
            width: Screen.width * 2
            height: Screen.height * 3

            TabBar {
                id: tabBarid
                currentIndex: 6
                // width: 1900
                width: Screen.width * 2

                TabButton {
                    id: tb1
                    // width: 305
                    width: Screen.width / 6
                    height: 40

                    Label {
                        id: lblid1
                        text: "Open"
                        color: "black"
                        font.pointSize: 13
                        anchors.centerIn: tb1
                    }

                    background: Rectangle {
                        id: rectid0
                        color: "#d9d9d9"
                        width: tabBarid.width
                    }

                    onClicked: {
                        rectid0.color = "#777f8c"
                        lblid1.color = "white"

                        lblid2.color = "black"
                        rectid1.color = "#d9d9d9"
                        lblid3.color = "black"
                        rectid2.color = "#d9d9d9"
                        lblid4.color = "black"
                        rectid3.color = "#d9d9d9"
                        lblid5.color = "black"
                        rectid4.color = "#d9d9d9"
                        lblid6.color = "black"
                        rectid5.color = "#d9d9d9"
                        mstackid.push("qrc:/Openfile.qml")
                    }
                }

                TabButton {
                    property int i: 0
                    id: tb2
                    // width: 305
                    width: Screen.width / 6
                    height: 40

                    Label {
                        id: lblid2
                        text: "Setting"
                        color: "black"
                        font.pointSize: 13
                        anchors.centerIn: tb2
                    }

                    background: Rectangle {
                        id: rectid1
                        color: "#d9d9d9" //"#f8b6e9"
                        width: tabBarid.width
                    }

                    onClicked: {
                        rectid1.color = "#777f8c"
                        lblid2.color = "white"

                        lblid1.color = "black"
                        rectid0.color = "#d9d9d9"
                        lblid3.color = "black"
                        rectid2.color = "#d9d9d9"
                        lblid4.color = "black"
                        rectid3.color = "#d9d9d9"
                        lblid5.color = "black"
                        rectid4.color = "#d9d9d9"
                        lblid6.color = "black"
                        rectid5.color = "#d9d9d9"

                        if (i == 0) {
                            mstackid.push("qrc:/Settingspage.qml")
                        }
                        else {
                            mstackid.pushExit
                        }
                    }
                }

                TabButton {
                    id: tb3
                    // width: 305
                    width: Screen.width / 6
                    height: 40

                    Label {
                        id: lblid3
                        text: "Flash Command"
                        color: "black"
                        font.pointSize: 13
                        anchors.centerIn: tb3
                    }

                    background: Rectangle {
                        id: rectid2
                        color: "#d9d9d9"
                        width: tabBarid.width
                    }

                    onClicked: {
                        rectid2.color = "#777f8c"
                        lblid3.color = "white"

                        lblid2.color = "black"
                        rectid1.color = "#d9d9d9"
                        lblid1.color = "black"
                        rectid0.color = "#d9d9d9"
                        lblid4.color = "black"
                        rectid3.color = "#d9d9d9"
                        lblid5.color = "black"
                        rectid4.color = "#d9d9d9"
                        lblid6.color = "black"
                        rectid5.color = "#d9d9d9"

                        mstackid.push("qrc:/Flashcmd.qml")
                    }
                }

                TabButton {
                    id: tb9
                    // width: 305
                    width: Screen.width / 6
                    height: 40

                    Label {
                        id: cmnch
                        text: "Communication Channel"
                        color: "black"
                        font.pointSize: 13
                        anchors.centerIn: tb9
                    }

                    background: Rectangle {
                        id: cmnchan
                        color: "#d9d9d9"
                        width: tabBarid.width
                    }

                    onClicked: {
                        rectid2.color = "#777f8c"
                        lblid3.color = "white"

                        lblid2.color = "black"
                        rectid1.color = "#d9d9d9"
                        lblid1.color = "black"
                        rectid0.color = "#d9d9d9"
                        lblid4.color = "black"
                        rectid3.color = "#d9d9d9"
                        lblid5.color = "black"
                        rectid4.color = "#d9d9d9"
                        lblid6.color = "black"
                        rectid5.color = "#d9d9d9"

                        mstackid.push("qrc:/Communication.qml")
                    }
                }

                TabButton {
                    id: tb4
                    // width: 305
                    width: Screen.width / 6
                    height: 40

                    Label {
                        id: lblid4
                        text: "Help"
                        color: "black"
                        font.pointSize: 13
                        anchors.centerIn: tb4
                    }

                    background: Rectangle {
                        id: rectid3
                        color: "#d9d9d9"
                        width: tabBarid.width
                    }

                    onClicked: {
                        rectid3.color = "#777f8c"
                        lblid4.color = "white"

                        lblid2.color = "black"
                        rectid1.color = "#d9d9d9"
                        lblid3.color = "black"
                        rectid2.color = "#d9d9d9"
                        lblid1.color = "black"
                        rectid0.color = "#d9d9d9"
                        lblid5.color = "black"
                        rectid4.color = "#d9d9d9"
                        lblid6.color = "black"
                        rectid5.color = "#d9d9d9"

                        mstackid.push("qrc:/Helppage.qml")
                    }
                }

                TabButton {
                    id: tb5
                    // width: 305
                    width: Screen.width / 6
                    height: 40
                    font.pointSize: 13

                    Label {
                        id: lblid5
                        text: "About"
                        color: "black"
                        font.pointSize: 13
                        anchors.centerIn: tb5
                    }

                    background: Rectangle {
                        id: rectid4
                        color: "#d9d9d9"
                        width: tabBarid.width
                    }

                    onClicked: {
                        rectid4.color = "#777f8c"
                        lblid5.color = "white"

                        lblid2.color = "black"
                        rectid1.color = "#d9d9d9"
                        lblid3.color = "black"
                        rectid2.color = "#d9d9d9"
                        lblid4.color = "black"
                        rectid3.color = "#d9d9d9"
                        lblid1.color = "black"
                        rectid0.color = "#d9d9d9"
                        lblid6.color = "black"
                        rectid5.color = "#d9d9d9"

                        mstackid.push("qrc:/Aboutpage.qml")
                    }
                }

                TabButton {
                    id: tb6
                    // width: 305
                    width: Screen.width / 6
                    height: 40

                    Label {
                        id: lblid6
                        text: "Exit"
                        color: "black"
                        font.pointSize: 13
                        anchors.centerIn: tb6
                    }

                    background: Rectangle {
                        id: rectid5
                        color: "#d9d9d9"
                        width: tabBarid.width
                    }

                    onClicked: confirmationDialog.open()

                    Dialog {
                        id: confirmationDialog
                        width: 310
                        height: 150

                        x: (parent.width - width) / 2
                        y: (parent.height - height) / 2
                        parent: Overlay.overlay

                        modal: true
                        title: "Closing Application"
                        standardButtons: Dialog.Ok | Dialog.Cancel

                        onAccepted: {
                            Qt.quit()
                        }

                        onRejected: {
                            confirmationDialog.close()
                        }

                        Row {
                            spacing: 10
                            Image {
                                id: questmarkid
                                source: "qrc:/Image/QuestionMark.png"
                                width: 30
                                height: 30
                            }

                            Label {
                                text: "Are you sure?"
                            }
                        }
                    }
                }
            }
        }

        // Rectangle {
        //     id: root
        //     width: 640
        //     height: 480
        //     visible: false

        //     Objref {
        //         id: ref
        //     }

        //     Timer {
        //         id: tm
        //         running: true
        //         interval: 1000
        //         repeat: true
        //         onTriggered: {
        //             ref.check();
        //             myPopup.visible = true; // Use a different id for your custom Popup
        //             hideTimer.start();
        //             // console.log("Timer_Worked or not")
        //             // if(txt.text == "true")
        //             // {
        //             //     tm.stop();
        //             // }
        //             // else
        //             // {
        //             //     tm.start();
        //             // }
        //         }
        //     }

        //     Timer {
        //         id: hideTimer
        //         interval: 2000
        //         repeat: false
        //         onTriggered: {
        //             myPopup.visible = false;
        //         }
        //     }

        //     Connections {
        //         target: ref
        //         onStatus: {
        //             myPopup.visible = val1;
        //             txt.text = val2;
        //             // tm.running = val3;
        //             rect.color = val3;

        //         }
        //     }

        //     Popup {
        //         id: myPopup
        //         visible: false
        //         width: 150
        //         height: 40

        //         x: 850
        //         y: 100

        //             Text {
        //                 id: txt
        //                 text: ""
        //                 color: "black"
        //                 x: 20
        //                 anchors.centerIn: myPopup
        //             }
        //         modal: true
        //         closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside
        //     }
        // }
    }

    StackView {
        id: mstackid
        anchors.fill: parent

        pushEnter: Transition {
            NumberAnimation {
                properties: "opacity"
                easing.type: Easing.Linear
                duration: 100
            }
        }

        pushExit: Transition {
            NumberAnimation {
                properties: "opacity"
                easing.type: Easing.Linear
                duration: 100
            }
        }

        popEnter: Transition {
            NumberAnimation {
                properties: "opacity"
                easing.type: Easing.Linear
                duration: 100
            }
        }

        popExit: Transition {
            NumberAnimation {
                properties: "opacity"
                easing.type: Easing.Linear
                duration: 100
            }
        }
    }
}



