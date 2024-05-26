import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
Popup {
    id:close_popup
    property alias buttonHieght: close_popup.height
    property alias  buttonWidth: close_popup.width
    property alias unsavedHeading: close_headtext.text
        property alias unsavedContent: unsaved_content.text
    signal yesBtnClicked
    signal noBtnClicked
    modal:true
    closePolicy:Popup.NoAutoClose



    contentItem:Rectangle{

        anchors.fill: parent
        height: parent.height
        width: parent.width
        id:pop_in
        color: "#373B3D"
        radius: 8


        //  color: "red"


        ColumnLayout{
            spacing: 0
            Rectangle{
                color: "#2B2D2E"//"#2B2D2E"
                height: 70//pop_in.height/3-5
                width: pop_in.width
                //radius: 8
                Text {
                    id: close_headtext
                    x:15
                    y:10
                    color: "white"
                    //anchors.leftMargin: 20
                    // anchors.topMargin: 20
                    text: qsTr("Closing Application")
                    font{
                        // bold: true
                        pointSize: Screen.height * 0.016
                        family: "C059"

                    }
                }

            }
            Rectangle{
                color: "#373B3D"
                height: 100//pop_in.height/3
                width: pop_in.width
                Label {
                    id:unsaved_content
                    anchors.centerIn: parent
                    text: "Do you want to Exit ..? All unsaved data will be lost"
                    font.pointSize: Screen.height * 0.015
                    font.family: "C059"
                    color: "white"
                }

            }
            Rectangle{
                Rectangle
                {
                    height: 0.51
                     width: pop_in.width
                     color: "#2B2D2E"
                }

                color: "#373B3D"
                height:100 //pop_in.height/3
                width: pop_in.width
                radius: 8

                RowLayout{
                    anchors.centerIn: parent
                    id:buttonLayout2
                    Button {
                        id: yesButton
                        enabled:true
                        Text {
                            text: "Yes"
                            font.family: "Helvetica"
                            font.pointSize: Screen.height * 0.015
                            font.bold: true
                            color: enabled ? "white" : "#8059E8"
                            anchors.centerIn: parent
                        }
                        Layout.preferredWidth: Math.round(195 * scalefactor)
                        Layout.preferredHeight: Math.round(40 * scalefactor)
                        height: Math.round(90 * scalefactor)
                        width: Math.round(200 * scalefactor)
                        background: Rectangle{
                            radius: 12
                            color: enabled?  "#8059E8" :"white" //"#373B3D"
                            border.color:  "#373B3D"
                            border.width: 2
                        }
                        onClicked: {
                            yesBtnClicked()
                            close_popup.close()
                        }
                    }

                    Button {
                        id: noButton
                        Text {
                            id:txt2
                            text:"No"
                            font.family: "Helvetica"
                            font.pointSize: Screen.height * 0.015
                            font.bold: true
                            color: "white"
                            anchors.centerIn: parent
                        }
                        Layout.preferredWidth: Math.round(195 * scalefactor)
                        Layout.preferredHeight: Math.round(40 * scalefactor)
                        height: Math.round(90 * scalefactor)
                        width: Math.round(200 * scalefactor)
                        background: Rectangle{
                            radius: 12
                            color: "#373B3D"
                            border.color: "#8059E8"
                            border.width: 2
                        }
                        onClicked: {
                            noBtnClicked()
                            close_popup.close()
                        }
                    }
                }

            }

            //     spacing: 20
            //     Text {
            //         id: close_headtext
            //         x:15
            //         y:10
            //         color: "white"
            //         //anchors.leftMargin: 20
            //         // anchors.topMargin: 20
            //         text: qsTr("Closing Application")
            //         font{
            //            // bold: true
            //             pointSize: Screen.height * 0.010
            //             family: "C059"

            //         }
            //     }
            //     Row {
            //         spacing: 10
            //         // Image {
            //         //     id: questmark1id
            //         //     source: "qrc:/UUU_Tool/Image/info.png"
            //         //     height: Math.round(25*scalefactor)
            //         //     width: Math.round(25*scalefactor)
            //         // }

            //         Label {
            //             text: "Do you want to Exit ..?All unsaved data will be lost"
            //             font.pointSize: Screen.height * 0.012
            //             font.family: "C059"
            //             color: "white"
            //         }
            //     }
            //     RowLayout{
            //         id:buttonLayout2
            //         Button {
            //             id: yesButton
            //             enabled:true
            //             Text {
            //                 text: "Yes"
            //                 font.family: "Helvetica"
            //                 font.pointSize: Screen.height * 0.015
            //                 font.bold: true
            //                 color: enabled ? "white" : "#8059E8"
            //                 anchors.centerIn: parent
            //             }
            //             Layout.preferredWidth: Math.round(195 * scalefactor)
            //             Layout.preferredHeight: Math.round(40 * scalefactor)
            //             height: Math.round(60 * scalefactor)
            //             width: Math.round(200 * scalefactor)
            //             background: Rectangle{
            //                 radius: 12
            //                 color: enabled?  "#8059E8" :"white" //"#373B3D"
            //                 border.color:  "#8059E8"
            //                 border.width: 2
            //             }
            //             onClicked: {
            //                 yesBtnClicked()
            //                  close_popup.close()
            //                 }
            //             }

            //         Button {
            //             id: noButton
            //             Text {
            //                 id:txt2
            //                 text:"No"
            //                 font.family: "Helvetica"
            //                 font.pointSize: Screen.height * 0.015
            //                 font.bold: true
            //                 color: "white"
            //                 anchors.centerIn: parent
            //             }
            //             Layout.preferredWidth: Math.round(195 * scalefactor)
            //             Layout.preferredHeight: Math.round(40 * scalefactor)
            //             height: Math.round(60 * scalefactor)
            //             width: Math.round(200 * scalefactor)
            //             background: Rectangle{
            //                 radius: 12
            //                 color: "transparent"
            //                 border.color: "#8059E8"
            //                 border.width: 2
            //             }
            //             onClicked: {
            //                 noBtnClicked()
            //                 close_popup.close()
            //             }
            //         }
            //     }
        }
    }
}
