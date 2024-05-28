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
                    text: qsTr(" Log Data")
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

    }
}
