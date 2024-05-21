import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3

Item {
    id: item
    property real scalefactor: {
        if (Screen.width > 1920) return 1.2;
        else if (Screen.height < 1080) return 0.8;
        else return 1;
    }

    height: parent.height
    width: parent.width
    visible: true
    implicitWidth: pdfview.visible ? pdfview.width : parent.width
    implicitHeight: pdfview.visible ? pdfview.height : parent.height
    signal productInfoClosed

    Rectangle {
        id: homePage
        anchors.fill: parent
        border.color: "black"
        border.width: 1
        radius: 8
        color: "#373B3D"

        ColumnLayout {
            id: homePageLayout
            spacing: 0
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            Layout.preferredHeight: 33

            Rectangle {
                id: barId
                Layout.fillWidth: true
                Layout.preferredHeight: 33
                radius: 8
                color: "#2B2D2E"

                Text {
                    id: protocolTextId
                    text: qsTr("UUU (Universal Update Utility)")
                    font.family: "Helvetica"
                    font.pointSize: Screen.height * 0.017
                    color: "#BABDC0"
                    anchors {
                        centerIn: parent
                        left: parent.left
                        verticalCenter: parent.verticalCenter
                        leftMargin: 10
                    }
                }

                Rectangle {
                    id: closerect
                    height: barId.height - 5
                    width: 30
                    anchors.right: parent.right
                    anchors.rightMargin: 3
                    anchors.verticalCenter: parent.verticalCenter
                    color: "#2B2D2E"

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
            }

            Rectangle {
                id: flickableContainer
                width: homePage.width - 19
                height: homePage.height - barId.height-1
                radius: 15
                color: "transparent"  // Transparent background


                Flickable {
                    id: pdfview
                    width: homePage.width+20
                    height:flickableContainer.height
                    anchors.top: barId.bottom
                    anchors.topMargin: 6
                    contentHeight: columnRects.height
                    clip: true
                    flickableDirection: Flickable.VerticalFlick
                    visible: true  // Ensure this is always visible
                    Column {
                        id: columnRects
                        width: pdfview.width-5
                        spacing: 10
                        anchors.horizontalCenter: parent.horizontalCenter
                        Image {
                            id: i2
                            source: "qrc:/UUU_Tool/Image/2.png"
                            width: columnRects.width - 20
                            height:pdfview.height-5
                            horizontalAlignment: Qt.AlignHCenter
                        }
                        Image {
                            id: i3
                            source: "qrc:/UUU_Tool/Image/3.png"
                            width: columnRects.width - 20
                            height:pdfview.height-5

                            horizontalAlignment: Qt.AlignHCenter
                        }
                    }
                }

            }


        }
    }
}
