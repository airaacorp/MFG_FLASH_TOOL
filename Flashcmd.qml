import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3

Item {
    id: flashcmdid

    property real scalefactor : {
        if(Screen.width > 1920) return 1.2
        else if(Screen.height < 1080) return 0.8
        else return 1
    }
    // height: Math.round(800*scalefactor)
    // width: Math.round(800*scalefactor)
    height: parent.height
    width: parent.width
    visible: true
    signal flashCommandClosed()

    Rectangle {
        id: rrr1
        anchors.fill: parent
        border.color: "black"
        border.width: 1

        Rectangle {
            id:r1
            height: 33
            width: parent.width
            color: "#777f8c"

            Rectangle{
                id:one
                Text {
                    id: txtid
                    text: qsTr(" Flash File")
                    font.family: "Helvetica"
                    font.pointSize: Screen.height * 0.017
                    color: "white"
                    leftPadding: 15
                    anchors{
                        left: r1.left
                    }
                }
            }

            Rectangle {
                anchors{
                    right: r1.right
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
                            flashcmdid.visible = false
                            closerect.visible=false
                            //whiterect.visible=false
                            //butoonsrow.visible=false
                            flashcmdid.flashCommandClosed()
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
                //         // height: Math.round(33*scalefactor)
                //         // width: Math.round(30*scalefactor)
                //         // anchors.centerIn: closeid
                //         anchors.fill: parent
                //     }

                //     onClicked: {
                //         homeid.visible = false
                //     }
                // }
            }
        }
        ColumnLayout {
            spacing: 15
            y: parent.height * 0.07
            x: parent.width * 0.01
            Row {
                spacing: 13

                Label {
                    text: "Options"
                    font.pointSize: Screen.height * 0.017
                    font.family: "Helvetica"
                }

                ComboBox {
                    id: _comb
                    model: ["Select","Windows", "Linux"]
                    onCurrentIndexChanged: {
                        if (currentIndex === 2) {
                            //butoonsrow.visible=true
                            //whiterect.visible=true
                            linuxTerminal.visible = true
                            windowsPromt.visible = false
                        } else if (currentIndex === 1) {
                            //butoonsrow.visible=true
                            //whiterect.visible=true
                            windowsPromt.visible = true
                            linuxTerminal.visible = false
                        }else{
                            if(currentIndex === 0){
                                linuxTerminal.visible=false
                                windowsPromt.visible=false
                                //butoonsrow.visible=false
                                //whiterect.visible=false
                            }
                        }
                    }
                }
            }

            Rectangle {
                id: linuxTerminal
                visible: false
                // height: Math.round(700*scalefactor)
                // width: Math.round(785*scalefactor)
                // height: 700/1080 *parent.height
                // width:parent.width
                height: 650/1080 * parent.height
                width: 750/1920*parent.width

                Column {
                    anchors.fill:parent
                    spacing: 10

                    Text {
                        id: linuxid
                        text: qsTr("Linux Terminal")
                        font.pointSize: Screen.height * 0.014
                    }

                    Row {
                        id: rowid
                        width:flashcmdid.width
                        height:commandInput.height
                        spacing: 10
                        TextField {
                            id: commandInput
                            placeholderText: "Enter command..."
                            font.family: "Helvetica"
                            width:flashcmdid.width-linuxlanchbutton.width-22
                        }

                        Button {
                            id:linuxlanchbutton
                            text: "Run"
                            font.family: "Helvetica"
                            onClicked: {
                                launcher.launchCommand(commandInput.text);
                            }
                            enabled: commandInput.text.trim().length > 0
                        }
                    }

                    Rectangle{
                        id:cmdrectangle
                        height:flashcmdid.height-200
                        // height: flashcmdid.height-rowid.x-rowid.height
                        width: flashcmdid.width*0.98
                        ScrollView {
                            // Adjust the position dynamically, here 0.1 indicates 10% from the top
                            anchors.fill:parent
                            visible: true
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
                    }
                }

                Connections {
                    target: launcher
                    onCommandOutputReady: {
                        commandOutput.text = output;
                    }
                }
            }

            Rectangle {
                id: windowsPromt
                visible: false
                // height: Math.round(650*scalefactor)
                // width: Math.round(750*scalefactor)
                height: 650/1080 * parent.height
                width: 750/1920*parent.width

                Column {
                    spacing: 10

                    Text {
                        id: cmdpromtid
                        text: qsTr("Command Promt")
                        font.pointSize: Screen.height * 0.014

                    }

                    Row {
                        id: rowid1
                        spacing: 10

                        TextField {
                            id: promtcommandInput
                            placeholderText: "Enter command..."
                            font.family: "Helvetica"
                            // width: Math.round(600*scalefactor)
                            width:flashcmdid.width-windowlanchButton.width-22

                        }

                        Button {
                            id:windowlanchButton
                            text: "Run"
                            font.family: "Helvetica"
                            onClicked: {
                                launcher.windowsPromt(promtcommandInput.text);
                            }
                            enabled: promtcommandInput.text.trim().length > 0
                        }
                    }

                    // ScrollView {
                    //     y: parent.height * 0.1 // Adjust the position dynamically, here 0.1 indicates 10% from the top
                    //     width: r1.width
                    //     height: parent.height * 0.866
                    //     anchors.bottomMargin:5

                    //     TextArea {
                    //         id: commandOutput1
                    //         width: parent.width
                    //         height: contentHeight
                    //         readOnly: true
                    //         wrapMode: TextEdit.WordWrap
                    //         anchors.top: parent.top
                    //         textFormat: TextEdit.PlainText

                    //         background: Rectangle {
                    //             color: "black"
                    //         }
                    //         color: "white"
                    //     }
                    // }
                    Rectangle{
                        id:cmdWinrectangle
                        height:flashcmdid.height-200
                        // height: flashcmdid.height-rowid.x-rowid.height
                        width: flashcmdid.width*0.98
                        ScrollView {
                            // Adjust the position dynamically, here 0.1 indicates 10% from the top
                            anchors.fill:parent
                            visible: true
                            TextArea {
                                id: commandOutput1
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
                    }
                }

                Connections {
                    target: launcher
                    onCommandOutputReady: {
                        commandOutput1.text = output;
                    }
                }
            }
        }
    }

    // Rectangle {
    //     visible: false;

    //     id: whiterect
    //     y: 500
    //     x: 7
    //     height: 200
    //     width: flashcmdid.width * 0.940
    //     color: "lightgrey"
    //     // border.width: 3  // Increase the border width for better visibility
    //     // border.color: "red"
    //     border {
    //           width: 10  // Define border width
    //           color: "black"  // Define border color
    //       }

    //       // Optional: Add a radius for rounded corners
    //       radius: 1

    //     ScrollView {
    //         anchors.fill: parent
    //         visible: true
    //         TextArea {
    //             width: parent.width
    //             height: parent.height
    //             readOnly: true
    //             wrapMode: TextEdit.WordWrap
    //             anchors.fill: parent

    //             textFormat: TextEdit.PlainText
    //             text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."

    //             background: Rectangle {
    //                 color: "white"
    //             }
    //             color: "black"
    //         }
    //     }
    // }
    // Row {
    //     id:butoonsrow
    //     visible: false;
    //     anchors.bottomMargin: 10
    //     anchors.bottom: parent.bottom
    //     anchors.horizontalCenter: parent.horizontalCenter
    //     spacing: 17  // Adjust the spacing between the buttons

    //     Button {
    //         Text {
    //             id:txt
    //             text:"Download logs"
    //             font.family: "Helvetica"
    //             font.pointSize: Screen.height * 0.015
    //             font.bold: true
    //             color: "white"
    //             anchors.centerIn: parent
    //         }
    //         height: Math.round(60 * scalefactor)
    //         width: Math.round(200 * scalefactor)
    //         background: Rectangle{
    //             radius: 60
    //             color: "#777f8c"
    //         }
    //         onClicked: {
    //             // Add your action for the first button here
    //         }
    //     }

    //     Button {

    //         Text {
    //             id:txt2
    //             text:"Clear logs"
    //             font.family: "Helvetica"
    //             font.pointSize: Screen.height * 0.015
    //             font.bold: true
    //             color: "white"
    //             anchors.centerIn: parent
    //         }
    //         height: Math.round(60 * scalefactor)
    //         width: Math.round(200 * scalefactor)
    //         background: Rectangle{
    //             radius: 60
    //             color: "#777f8c"
    //         }

    //         onClicked: {
    //             // Add your action for the second button here
    //         }
    //     }
    // }

}

