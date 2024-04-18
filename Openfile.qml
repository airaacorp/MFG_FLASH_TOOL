// import QtQuick 2.15
// import QtQuick.Controls 2.15
// import QtQuick.Layouts 1.3
// import QtQuick.Dialogs
// import com.airaacorporates

// Rectangle {
//     id: windowid
//     property real scalefactor : {
//         if(Screen.width > 1920) return 1.2
//         else if(Screen.height < 1080) return 0.8
//         else return 1
//     }
//     height: parent.height
//     width: parent.width
//     visible: true

//     Rectangle {
//         id:homePage
//         anchors.fill: parent
//         border.color: "black"
//         border.width: 1

//         Rectangle {
//             id:barId
//             height: 33
//             width: parent.width
//             color: "#007EE3"
//             // Row {
//             Text {
//                 id: protocolTextId
//                 text: qsTr("Communication Channels")
//                 font.family: "Helvetica"
//                 font.pointSize: Screen.height * 0.017
//                 color: "white"
//                 anchors.left: parent.left
//             }
//             Button {
//                 id: closeid
//                 height:barId.height
//                 width: 30
//                 // anchors.rightMargin: 10
//                 anchors.right: parent.right
//                 Image {
//                     id: close
//                     source: "qrc:/Image/Close_red.png"
//                     // height: Math.round(33*scalefactor)
//                     // width: Math.round(30*scalefactor)
//                     anchors.fill: parent
//                     // anchors.centerIn: closeid
//                     // anchors.right: parent.right
//                 }
//                 onClicked: {
//                     console.log("height button",closeid.height)
//                     console.log("width button",closeid.width)
//                     homePage.visible = false
//                 }
//             }
//         }

//         Rectangle {
//             Row {
//                 spacing: 20
//                 y: 50
//                 x: 20
//                 Text {
//                     x: Math.round(10*scalefactor)
//                     id: protocolTextId1
//                     text: qsTr("Communication Channel")
//                     font.family: "Helvetica"
//                     font.pointSize: Screen.height * 0.017
//                     // anchors.top: barId.bottom
//                     // anchors.topMargin: Math.round(50 * scalefactor)
//                 }

//                 ComboBox
//                 {
//                     id: protocolComboId
//                     visible: true
//                     width: Math.round(200*scalefactor)
//                     // anchors.left: protocolTextId1.right
//                     // anchors.top: barId.bottom
//                     // anchors.topMargin: Math.round(50* scalefactor)
//                     // anchors.leftMargin: Math.round(20 * scalefactor)
//                     // anchors.rightMargin: Math.round(10 * scalefactor)
//                     model: ["Select", "RS232", "I2C", "SPI"]
//                     font.family: "Helvetica"
//                     font.pointSize: Screen.height * 0.017
//                     delegate: ItemDelegate{
//                         text: modelData
//                         font.pixelSize: 20
//                         width: parent.width
//                         font.family: "Helvetica"
//                     }
//                 }
//             }

//             Row {
//                 spacing: Math.round(10 * scalefactor)
//                 // anchors.bottom: parent.bottom
//                 // anchors.bottomMargin: 20
//                 // anchors.horizontalCenter: parent.horizontalCenter
//                 y: 650
//                 x: 200
//                 Button {
//                     id: proceedButton
//                     text: "Proceed"
//                     font.family: "Helvetica"
//                     font.bold: true
//                     font.pointSize: Screen.height * 0.017
//                     height: Math.round(60 * scalefactor)
//                     width: Math.round(260 * scalefactor)
//                     onClicked: {
//                         if (protocolComboId.currentIndex === 0) {
//                             showPopup("Please select any Communication channel...", "red")
//                         } else {
//                             deviceRect.visible = true
//                             proceedButton.visible = false
//                             cancelButton.visible = false
//                             homePage.border.width = 0
//                         }
//                     }
//                 }
//                 Button {
//                     id: cancelButton
//                     text: "Cancel"
//                     font.family: "Helvetica"
//                     font.bold: true
//                     font.pointSize: Screen.height * 0.017
//                     height: Math.round(60 * scalefactor)
//                     width: Math.round(260 * scalefactor)
//                     onClicked: {
//                         protocolid.visible = false
//                     }
//                 }
//             }
//         }

//         Rectangle {
//             id: deviceRect
//             height: parent.height//Math.round(600*scalefactor)
//             width: homePage.width//Math.round(798*scalefactor)
//             x:Math.round(1 * scalefactor)
//             y: Math.round(33 * scalefactor)
//             visible: false
//             // color:"red"
//             border.width: 1

//             Button {
//                 id:bb
//                 height: Math.round(40*scalefactor)
//                 width: Math.round(40*scalefactor)
//                 y:Math.round(27* scalefactor)
//                 x:Math.round(5*scalefactor)
//                 ToolTip.delay: 1000
//                 ToolTip.visible: hovered
//                 ToolTip.text: "GO back one page "
//                 background: Rectangle {
//                     color: "#777f8c"
//                     border.color: "black"
//                     radius: 5
//                 }
//                 Image {
//                     id: bbimage
//                     height: Math.round(40*scalefactor)
//                     width: Math.round(40*scalefactor)
//                     source: "qrc:/Image/BackButton.png"
//                 }
//                 contentItem: Text {
//                     text: bb.text
//                     color: "white"
//                     horizontalAlignment: Text.AlignHCenter
//                     verticalAlignment: Text.AlignVCenter
//                     font.bold: true
//                 }
//                 onClicked: {
//                     homePage.visible = true
//                     deviceRect.visible = false
//                 }
//             }

//             Text {
//                 id: deviceText
//                 text: qsTr("Connect your device")
//                 font.pointSize: Screen.height * 0.025
//                 font.family: "Helvetica"
//                 // anchors {
//                 //     //horizontalCenter: parent.horizontalCenter
//                 //     top: deviceText.top
//                 //     topMargin: 60
//                 //     //bottomMargin: 10
//                 // }
//                 //x: Math.round(220 * scalefactor)
//                 //y: Math.round(100 * scalefactor)
//                 x:parent.width * 0.26
//                 y:parent.height * 0.1
//             }

//             Column {
//                 spacing: Math.round(10 * scalefactor)
//                 anchors.centerIn: parent
//                 anchors {
//                     top: deviceText.bottom
//                     horizontalCenter: parent.horizontalCenter
//                 }
//                 Row {
//                     spacing: Math.round(5 * scalefactor)
//                     Text {
//                         text: "Port Number:"
//                         font.family: "Helvetica"
//                         font.pointSize: Screen.height * 0.018
//                         width: Math.round(190*scalefactor)
//                     }
//                     TextField {
//                         id: portNameTextField
//                         height: Math.round(60*scalefactor)
//                         width: Math.round(260*scalefactor)
//                         placeholderText: "Enter Port Number"
//                         font.family: "Helvetica"
//                         font.pointSize: Screen.height * 0.014
//                     }
//                 }

//                 Row {
//                     spacing: Math.round(5 * scalefactor)
//                     Text {
//                         text: "Frequency:"
//                         font.family: "Helvetica"
//                         font.pointSize: Screen.height * 0.018
//                         width: Math.round(190*scalefactor)
//                     }
//                     TextField {
//                         id: baudRateTextField
//                         height: Math.round(60*scalefactor)
//                         width: Math.round(260*scalefactor)
//                         placeholderText: "Enter Frequency Rate"
//                         font.family: "Helvetica"
//                         font.pointSize: Screen.height * 0.014
//                     }
//                 }
//             }

//             Button {
//                 id: connectButton
//                 text: "Connect"
//                 font.family: "Helvetica"
//                 font.bold: true
//                 font.pointSize: Screen.height * 0.017
//                 height: Math.round(60*scalefactor)
//                 width: Math.round(260*scalefactor)
//                 y: Math.round(500 * scalefactor)
//                 x: Math.round(250 * scalefactor)
//                 // anchors {
//                 //            left: parent.left
//                 //           topMargin: 100
//                 //           leftMargin: 200
//                 //            // Adjust the x and y offsets as necessary
//                 //            // x: Math.round(170 * scalefactor)
//                 //            // y: Math.round(400 * scalefactor)
//                 //        }
//                 onClicked: {
//                     if (portNameTextField.text.trim() === "" || baudRateTextField.text.trim() === "") {
//                         showPopup("Please provide PORT NUMBER AND FREQUENCY", "red")
//                     } else {
//                         serialComm.connectSerial(portNameTextField.text,baudRateTextField.text);
//                         sendDataButton.visible = true
//                         closeSerialButton.visible = true
//                         connectButton.visible = false
//                     }
//                 }
//             }

//             Row {
//                 spacing: Math.round(15 * scalefactor)
//                 // x: 150
//                 // y: 500
//                 anchors {
//                     horizontalCenter: parent.horizontalCenter
//                     bottom: parent.bottom
//                     bottomMargin: Math.round(100 * scalefactor)
//                 }
//                 // anchors.bottomMargin: 20
//                 Button {
//                     id: sendDataButton
//                     text: "Send Data"
//                     font.family: "Helvetica"
//                     font.pointSize: Screen.height * 0.014
//                     height: Math.round(60*scalefactor)
//                     width: Math.round(260*scalefactor)
//                     visible: serialComm.isPortConnected()
//                     onClicked: {
//                         rowId1.visible = true
//                     }
//                 }
//                 Button {
//                     id: closeSerialButton
//                     text: "Close SerialPort"
//                     font.family: "Helvetica"
//                     font.pointSize: Screen.height * 0.014
//                     height: Math.round(60*scalefactor)
//                     width: Math.round(260*scalefactor)
//                     visible: serialComm.isPortConnected()
//                     onClicked: {
//                         serialComm.closeSerial()
//                     }
//                 }
//             }
//             Popup {
//                 onClosed: {
//                     dynamicTextField.text = ""
//                 }
//             }

//             Row {
//                 id: rowId1
//                 anchors.bottom: parent.bottom
//                 anchors.bottomMargin: 20
//                 anchors.horizontalCenter: parent.horizontalCenter
//                 // y:600
//                 // x:50
//                 x: Math.round(10* scalefactor)
//                 //  x: Math.round(50 * scalefactor)
//                 spacing: Math.round(12 * scalefactor)
//                 visible: false
//                 TextField {
//                     id: filePathInput
//                     // width: Math.round(500*scalefactor)
//                     width: deviceRect.width-sendFileButton.width-22
//                     height: Math.round(60 * scalefactor)
//                     placeholderText: "Enter file path(s)"
//                 }
//                 Button {
//                     id: sendFileButton
//                     text: "Send File(s)"
//                     font.family: "Helvetica"
//                     onClicked: {
//                         var paths = filePathInput.text.trim().split(","); // Split input by comma to get multiple paths
//                         if (paths.length === 1 && paths[0] === "") {
//                             // If the user hasn't entered any paths, display a popup
//                             popupText.text = "Please enter a file path.","red"
//                             popup.visible = true
//                             popupTimer.restart()
//                         } else {
//                             for (var i = 0; i < paths.length; i++) {
//                                 var path = paths[i].trim();
//                                 if (path !== "" && path !== undefined) {
//                                     // Sending file or folder
//                                     serialComm.sendFile(path);
//                                 } else {
//                                     // Log error message
//                                     console.log("Please enter a valid file path.");
//                                 }
//                             }
//                         }
//                     }
//                 }
//             }
//         }
//     }
// }
