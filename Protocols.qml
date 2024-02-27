import QtQuick 2.15
import QtQuick.Controls

ApplicationWindow {
    visible: true
    width: 540
    height: 450
    title: "Communication Channel Selection"

    Rectangle {
        id: homePage
        width: 540
        height: 450
        color: "white"

        Rectangle {
            width: 540
            height: 25
            color: "#777f8c"

            Row {
                spacing: 474

                Text {
                    id: titleTxt
                    text: qsTr("Title")
                    x: 5
                    y: 1
                    font.pointSize: 13
                    color: "white"
                }

                Button {
                    id: closeid
                    width: 25
                    height: 25
                    x: 470

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

        Text {
            text: "Please select communication channel:"
            anchors.top: titleTxt.bottom
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.topMargin: 10
        }

        ComboBox {
            id: channelDropdown
            width: 150
            model: ["RS232", "I2C", "SPI"]
            anchors.top: titleTxt.bottom
            anchors.right: parent.right
            anchors.topMargin: 10
            anchors.rightMargin: 10
        }

        Button {
            text: "Proceed"
            onClicked: {
                // Perform actions or navigation to another page here
                console.log("Selected Communication Channel: " + channelDropdown.currentText);
                // Add navigation logic to move to another page
            }
            anchors.centerIn: parent
            anchors.topMargin: 50
        }
    }
}
