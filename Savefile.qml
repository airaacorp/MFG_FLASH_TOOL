import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3

Item {
    width: 540
    height: 300
    visible: true
    id: saveid
    anchors.centerIn: parent

    Rectangle {
        width: 540
        height: 300
        color: "white"
        anchors.fill: parent
        id: rectid

        Rectangle {
            width: 540
            height: 25
            color: "#777F8C"

            Text {
                id: txtid
                text: qsTr(" Save Statistic File")
                x: 5
                y: 1
                font.pointSize: 13
                color: "white"
            }

            Button {
            id: closeid
            width: 25
            height: 25
            x: 514

                Image {
                    id: close
                    source: "qrc:/Image/Close_red.png"
                    width: 25
                    height: 25
                    anchors.centerIn: closeid
                }

                onClicked: {
                    saveid.visible = false
                }
            }
        }

    Column {
        spacing: 23
        y: 25
        x: 7

        Row {
            spacing: 13

            ComboBox {
                y: 10
                id: combid
                width: 360
                height: 50
                font.pointSize: 13
            }

            Rectangle {
                y: 10
                id: rect1id
                width: 150
                height: 37
                border.width: 1
                border.color: "lightgray"

                TextField {
                    id: textfid
                    width: 150
                    height: 37
                    placeholderText: "Search"
                }

                Image {
                    id: searchid
                    source: "qrc:/Image/Search.png"
                    visible: true
                    width: 30
                    height: 30
                    anchors.right: rect1id.right
                }
            }
        }

        Row {
            spacing: 7
            Label {
                y: 10
                text: "File Name: "
                font.pointSize: 13
            }

            TextField {
                id: field
                placeholderText: "Name"
            }
        }

        Row {
            spacing: 7
            Label {
                text: "File Type:   "
                font.pointSize: 13
            }

            Frame {
                x: 200
                id: rect3id
                width: 103
                height: 36

                ComboBox {
                    y: -10
                    x: -10
                    id: combboxid
                    width: 100
                    height: 32
                    anchors.centerIn: rect3id
                    font.pointSize: 13
                    model: [".xls", ".dox", ".pdf", ".exe", ".tar"]
                }
            }
        }
    }

        Row {
            x: 320
            y: 250
            spacing: 10

            Button {
                text: "Save"
                width: 100
                height: 40
                onClicked: popup.open()

                Popup {
                        id: popup
                        width: 250
                        height: 80
                        modal: true
                        x: (parent.width - width) / 2
                        y: (parent.height - height) / 2
                        parent: Overlay.overlay

                        Row {
                            spacing: 10
                            Image {
                                id: imgid
                                source: "qrc:/Image/tick_icon.png"
                                width: 40
                                height: 40
                            }

                            Text {
                                id: txt
                                y: 10
                                text: qsTr("Saved Successfully!")
                                anchors.centerIn: popup
                                font.pointSize: 13
                            }
                        }

                        focus: true
                        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
                    }
                }

            Button {
                text: "Cancel"
                width: 100
                height: 40
                onClicked: {
                    saveid.visible = false
                    Settingspage.visible = true
                }
            }
        }
    }
}
