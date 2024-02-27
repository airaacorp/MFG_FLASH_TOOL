import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    width: 540
    height: 450
    visible: true
    anchors.centerIn: parent

    Rectangle {
        id:homePage
        anchors.fill: parent
        border.color: "black"
        border.width: 1

        Rectangle {
            width: 540
            height: 25
            color: "#777f8c"

            Row {
                spacing: 474

                Text {
                    id: txtid
                    text: qsTr(" Help")
                    x: 5
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
    }
}
