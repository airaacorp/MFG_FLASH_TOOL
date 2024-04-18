import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
import QtQuick.Dialogs
import com.airaacorporates

Rectangle {
    id: windowid
    property real scalefactor : {
        if(Screen.width > 1920) return 1.2
        else if(Screen.height < 1080) return 0.8
        else return 1
    }
    height: parent.height
    width: parent.width
    visible: true

    function showPopup(message,color){
        popupText.text=message
        popup.color=color
        popup.visible =true
        popup.close()
    }
    function showPopup1(message,color){
        popupText1.text=message
        popup1.color=color
        popup1.visible =true
        popup1.close()

    }
    function showPopup2(message,color){
        popupText2.text=message
        popup2.color=color
        popup2.visible =true
        popup2.close()

    }
    function showPopup3(message,color){
        popupText3.text=message
        popup3.color=color
        popup3.visible =true
        popupTimer3.restart()
        //popup3.close()
    }
    Rectangle {
        id:homePage
        anchors.fill: parent
        border.color: "black"
        border.width: 1

        Rectangle {
            id:barId
            height: 33
            width: parent.width
            color: "#777f8c"
            // Row {
            Text {
                id: protocolTextId
                text: qsTr("Communication Channels")
                font.family: "Helvetica"
                font.pointSize: Screen.height * 0.017
                color: "white"
                anchors.left: parent.left
                leftPadding: 15
            }
            Rectangle{
                id:closerect
                height:barId.height

                width: 30

                // anchors.rightMargin: 10

                anchors.right: parent.right
                color:"#a9a9a9"

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
                        windowid.visible = false
                        closerect.visible=flase
                    }
                }
            }
            // Button {
            //     id: closeid
            //     height:barId.height
            //     width: 30
            //     // anchors.rightMargin: 10
            //     rightPadding: 10
            //     anchors.right: parent.right
            //     Image {
            //         id: close
            //         source: "qrc:/Image/Close_red.png"
            //         anchors.fill: parent
            //     }
            //     onClicked: {
            //         windowid.visible = false
            //     }
            // }
            Text {
                x: Math.round(10*scalefactor)
                id: protocolTextId1
                text: qsTr("Communication Channel")
                font.family: "Helvetica"
                font.pointSize: Screen.height * 0.017
                anchors.top: barId.bottom
                anchors.topMargin: Math.round(20 * scalefactor)

            }
            ComboBox
            {
                id: protocolComboId
                visible: true
                width: Math.round(200*scalefactor)
                anchors.left: protocolTextId1.right
                anchors.top: barId.bottom
                anchors.topMargin: Math.round(20* scalefactor)
                anchors.leftMargin: Math.round(20 * scalefactor)
                anchors.rightMargin: Math.round(10 * scalefactor)
                model: ["Select", "RS232"]/*, "I2C", "SPI"*/
                font.family: "Helvetica"
                font.pointSize: Screen.height * 0.017
                delegate: ItemDelegate{
                    text: modelData
                    font.pointSize: Screen.height * 0.017
                    width: parent.width
                    font.family: "Helvetica"
                }
                onActivated: {
                    if (currentIndex !== 0) {
                        popup1.visible = false;
                    }
                }
            }
            Row {
                spacing: Math.round(10 * scalefactor)

                anchors {
                    horizontalCenter: parent.horizontalCenter
                    bottom: parent.bottom
                    bottomMargin: Math.round(-540 * scalefactor)
                }
                Button {
                    id: proceedButton
                    Text {
                        text: "Proceed"
                        font.family: "Helvetica"
                        font.pointSize: Screen.height * 0.015
                        font.bold: true
                        color: "white"
                        anchors.centerIn: parent
                    }
                    height: Math.round(60 * scalefactor)
                    width: Math.round(200 * scalefactor)
                    background: Rectangle{
                        radius: 60
                        color: "#777f8c"
                    }
                    onClicked: {
                        if (protocolComboId.currentIndex === 0) {
                            showPopup1("Please select any Communication channel...", "transparent")
                        } else {

                            deviceRect.visible = true
                            proceedButton.visible = false
                            cancelButton.visible = false
                            homePage.border.width = 0
                            popup1.visible=false
                        }
                    }
                }
                Button {
                    id: cancelButton
                    Text {
                        id:txt
                        text:"Cancel"
                        font.family: "Helvetica"
                        font.pointSize: Screen.height * 0.015
                        font.bold: true
                        color: "white"
                        anchors.centerIn: parent
                    }
                    height: Math.round(60 * scalefactor)
                    width: Math.round(200 * scalefactor)
                    background: Rectangle{
                        radius: 60
                        color: "#777f8c"
                    }
                    onClicked: {
                        protocolComboId.currentIndex=0;
                        protocolid.visible = false
                    }
                }
            }
        }

        Rectangle {
            id: deviceRect
            height: parent.height - 32
            width: homePage.width
            x:Math.round(1 * scalefactor)
            y: Math.round(33 * scalefactor)
            visible: false
            border.width: 1

            Button {
                id:bb
                height: Math.round(40*scalefactor)
                width: Math.round(40*scalefactor)
                y:Math.round(27* scalefactor)
                x:Math.round(5*scalefactor)
                ToolTip.delay: 1000
                ToolTip.visible: hovered
                ToolTip.text: "Previous Page"
                background: Rectangle {
                    color: "#777f8c"
                    border.color: "black"
                    radius: 5
                }
                Image {
                    id: bbimage
                    height: Math.round(40*scalefactor)
                    width: Math.round(40*scalefactor)
                    source: "qrc:/Image/BackButton.png"
                }
                contentItem: Text {
                    text: bb.text
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                }
                onClicked: {
                    homePage.visible = true
                    deviceRect.visible = false
                    popup.visible = false
                    popup2.visible = false
                    if(protocolComboId.currentIndex !== 0){
                        console.log("***protocolComboId.currentIndex***",protocolComboId.currentIndex);
                        protocolComboId.currentIndex = 0;
                    }
                    if(!proceedButton.visible && !cancelButton.visible){
                        proceedButton.visible =true
                        cancelButton.visible=true
                        portNameTextField.clear();
                        baudRateTextField.clear();
                        filePathInput.clear();
                        connectButton.visible=true
                        sendDataButton.visible=false
                        closeSerialButton.visible=false
                        rowId1.visible=false
                        popupText1.visible = true
                        popupText2.visible = true
                        popupText3.visible = true
                        popupText.visible= true
                    }
                }
            }

            Text {
                id: deviceText
                text: qsTr("Connect your device")
                font.pointSize: Screen.height * 0.025
                font.family: "Helvetica"
                x:parent.width * 0.26
                y:parent.height * 0.1
            }

            Column {
                spacing: Math.round(10 * scalefactor)
                anchors.centerIn: parent
                anchors {
                    top: deviceText.bottom
                    horizontalCenter: parent.horizontalCenter
                }
                // Row {
                //     spacing: Math.round(5 * scalefactor)
                //     Text {
                //         text: "Port Number:"
                //         font.family: "Helvetica"
                //         font.pointSize: Screen.height * 0.017
                //         width: Math.round(190*scalefactor)
                //     }
                //     TextField {
                //         id: portNameTextField
                //         height: Math.round(60*scalefactor)
                //         width: Math.round(260*scalefactor)
                //         placeholderText: "Enter Port Number"
                //         font.family: "Helvetica"
                //         font.pointSize: Screen.height * 0.014
                //         // background: Rectangle{
                //         //     id:invalid
                //         //     anchors.fill: parent
                //         //     color: "red"

                //         // }

                //         onTextChanged: {
                //             var pattern = /^[a-zA-Z0-9\/]*$/;
                //             if (!text.startsWith("/") || !pattern.test(text)) {
                //                 // Display error message
                //                 // invalid.color=true
                //                 showPopup2("Invalid Input", "transparent");
                //             } else {
                //                 // Hide error message
                //                 popup2.visible = false;
                //                 popupText.visible =false
                //             }
                //         }
                //         property var pattern: /^[a-zA-Z0-9\/]*$/
                //     }

                // }

                Row {
                    spacing: Math.round(5 * scalefactor)
                    Text {
                        text: "Port Number:"
                        font.family: "Helvetica"
                        font.pointSize: Screen.height * 0.017
                        width: Math.round(190*scalefactor)
                    }
                    TextField {
                        id: portNameTextField
                        height: Math.round(60*scalefactor)
                        width: Math.round(260*scalefactor)
                        placeholderText: "Enter Port Number"
                        font.family: "Helvetica"
                        font.pointSize: Screen.height * 0.014
                        background: Rectangle {
                            color: portNameTextField.focus ? "#d9d9d9" : "#F8F8FF"
                            border.color: portNameTextField.invalidInput && !portNameTextField.focus ? "red" : "#CCCCCC"
                            radius: 5

                            MouseArea {
                                anchors.fill: parent
                                hoverEnabled: true
                                onEntered: {
                                    if (!portNameTextField.focus && !portNameTextField.invalidInput)
                                        parent.color = "#E0E0E0";
                                }
                                onExited: {
                                    if (!portNameTextField.focus && !portNameTextField.invalidInput)
                                        parent.color = "#F8F8FF";
                                }
                            }
                        }

                        onTextChanged: {
                            var pattern = /^[a-zA-Z0-9\/]*$/;
                            portNameTextField.invalidInput = !text.startsWith("/") || !pattern.test(text);
                            if (portNameTextField.invalidInput && !hasFocus) {
                                border.color = "red";
                                showPopup2("Invalid Input", "transparent");
                            } else {
                                border.color = "#CCCCCC";
                                popup2.visible = false;
                                popupText.visible = true;
                            }
                        }
                        property bool invalidInput: false
                        property var pattern: /^[a-zA-Z0-9\/]*$/
                    }
                }

                // Row {
                //     spacing: Math.round(5 * scalefactor)
                //     Text {
                //         text: "Frequency:"
                //         font.family: "Helvetica"
                //         font.pointSize: Screen.height * 0.017
                //         width: Math.round(190*scalefactor)
                //     }
                //     TextField {
                //         id: baudRateTextField
                //         height: Math.round(60*scalefactor)
                //         width: Math.round(260*scalefactor)
                //         placeholderText: "Enter Frequency Rate"
                //         font.family: "Helvetica"
                //         font.pointSize: Screen.height * 0.014
                //         onTextChanged: {
                //             var pattern = /^[0-9]*$/;
                //             if (!pattern.test(text)) {
                //                 showPopup2("Invalid Input", "transparent");
                //             } else {
                //                 popup2.visible = false;
                //                 popupText.visible =false
                //             }
                //         }
                //     }
                // }

                Row {
                    spacing: Math.round(5 * scalefactor)
                    Text {
                        text: "Frequency:"
                        font.family: "Helvetica"
                        font.pointSize: Screen.height * 0.017
                        width: Math.round(190*scalefactor)
                    }
                    TextField {
                        id: baudRateTextField
                        height: Math.round(60*scalefactor)
                        width: Math.round(260*scalefactor)
                        placeholderText: "Enter Frequency Rate"
                        font.family: "Helvetica"
                        font.pointSize: Screen.height * 0.014
                        background: Rectangle {
                            color: baudRateTextField.focus ? "#F0F0F0" : "#F8F8FF"
                            border.color: baudRateTextField.invalidInput && !baudRateTextField.focus ? "red" : "#CCCCCC"
                            radius: 5

                            MouseArea {
                                anchors.fill: parent
                                hoverEnabled: true
                                onEntered: {
                                    if (!baudRateTextField.focus && !baudRateTextField.invalidInput)
                                        parent.color = "#E0E0E0";
                                }
                                onExited: {
                                    if (!baudRateTextField.focus && !baudRateTextField.invalidInput)
                                        parent.color = "#F8F8FF";
                                }
                            }
                        }

                        onTextChanged: {
                            var pattern = /^[0-9]*$/;
                            baudRateTextField.invalidInput = !pattern.test(text);
                            if (baudRateTextField.invalidInput && !hasFocus) {
                                border.color = "red";
                                showPopup2("Invalid Input", "transparent");
                            } else {
                                border.color = "#CCCCCC";
                                popup2.visible = false;
                                popupText.visible = false;
                            }
                        }
                        property bool invalidInput: false
                    }
                }

            }

            Button {
                id: connectButton
                Text {
                    text: "Connect"
                    font.family: "Helvetica"
                    font.pointSize: Screen.height * 0.015
                    font.bold: true
                    color: "white"
                    anchors.centerIn: parent
                }
                height: Math.round(60*scalefactor)
                width: Math.round(200*scalefactor)
                background: Rectangle{
                    radius: 60
                    color: "#777f8c"
                }
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    bottom: parent.bottom
                    bottomMargin: Math.round(100 * scalefactor)
                }
                onClicked: {
                    var portPattern = /^[a-zA-Z0-9\/]*$/;
                    var frequencyPattern = /^[0-9]*$/;

                    if (portNameTextField.text.trim() === "" || baudRateTextField.text.trim() === "") {
                        showPopup("Please provide Port Number and Frequency", "transparent");
                    } else if (!portPattern.test(portNameTextField.text) || !frequencyPattern.test(baudRateTextField.text)) {
                        showPopup("Invalid Port Number or Frequency", "transparent");
                    } else {
                        // If both inputs are valid, proceed to connect
                        serialComm.connectSerial(portNameTextField.text, baudRateTextField.text);
                        sendDataButton.visible = true;
                        closeSerialButton.visible = true;
                        connectButton.visible = false;
                        showPopup3("Connected successfully", "transparent");
                    }
                }
            }

            Row {
                spacing: Math.round(15 * scalefactor)
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    bottom: parent.bottom
                    bottomMargin: Math.round(100 * scalefactor)
                }
                Button {
                    id: sendDataButton
                    Text {
                        text: "Send Data"
                        font.family: "Helvetica"
                        font.pointSize: Screen.height * 0.015
                        font.bold: true
                        color: "white"
                        anchors.centerIn: parent
                    }
                    height: Math.round(60*scalefactor)
                    width: Math.round(200*scalefactor)
                    background: Rectangle{
                        radius: 60
                        color: "#777f8c"
                    }
                    visible: serialComm.isPortConnected()
                    onClicked: {
                        rowId1.visible = true
                    }
                }
                Button {
                    id: closeSerialButton
                    Text {
                        text: "Port Disconnect"
                        font.family: "Helvetica"
                        font.pointSize: Screen.height * 0.015
                        font.bold: true
                        color: "white"
                        anchors.centerIn: parent
                    }
                    height: Math.round(60*scalefactor)
                    width: Math.round(260*scalefactor)
                    background: Rectangle{
                        radius: 60
                        color: "#777f8c"
                    }
                    visible: serialComm.isPortConnected()
                    onClicked: {
                        serialComm.closeSerial()

                    }
                }
            }
            Popup {
                onClosed: {
                    dynamicTextField.text = "";
                    errorLabelContainer.visible = false;
                }
            }

            Row {
                id: rowId1
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 20
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: Math.round(5 * scalefactor)
                visible: false
                TextField {
                    id: filePathInput
                    // width: Math.round(500*scalefactor)
                    width: deviceRect.width-sendFileButton.width-22
                    height: Math.round(60 * scalefactor)
                    placeholderText: "Enter file path(s)"
                }
                Button {
                    id: sendFileButton
                    Text {
                        text: "Send"
                        font.family: "Helvetica"
                        font.pointSize: Screen.height * 0.015
                        font.bold: true
                        rightPadding: 10
                        color: "white"
                        anchors.centerIn: parent
                    }
                    height: 60
                    width: 150
                    background: Rectangle{
                        radius: 60
                        color: "#777f8c"
                    }
                    onClicked: {
                        var paths = filePathInput.text.trim().split(","); // Split input by comma to get multiple paths
                        if (paths.length === 1 && paths[0] === "") {
                            // If the user hasn't entered any paths, display a popup
                            popupText2.text = "Please enter a file path.","transparent"
                            popup2.visible = true
                        } else {
                            popupText2.visible = false
                            for (var i = 0; i < paths.length; i++) {
                                var path = paths[i].trim();
                                if (path !== "" && path !== undefined) {
                                    // Sending file or folder
                                    serialComm.sendFile(path);
                                } else {
                                    // Log error message
                                    console.log("Please enter a valid file path.");
                                }
                            }
                        }
                    }
                }
                Connections {
                    target: fileTransfer
                    onFileTransferFailed: showErrorLabel(error)
                    onFileTransferCompleted: console.log("File transfer completed successfully")
                }
            }
        }
        function showSuccessLabel(successMessage) {
            errorLabel.text = successMessage;
            errorLabel.color = "green";
            errorLabelContainer.visible = true;
        }
    }
    Rectangle {
        id: popup
        width: 450
        height: 50
        color: "transparent"
        // border.color: "black"
        radius: 10
        visible: false
        anchors {
            horizontalCenter: parent.horizontalCenter
            bottom: parent.bottom
            bottomMargin: Math.round(150 * scalefactor)
        }

        Text {
            id: popupText
            anchors.centerIn: parent
            // font.bold: true
            font.pixelSize: 18
            color: "red"
            text: ""
        }
    }
    Rectangle {
        id: popup1
        width: 450
        height: 50
        color: "transparent"
        visible: false
        x: (parent.width - width) / 2 + 10 // 150 - 50/2
        y:parent.height*0.6

        Text {
            id: popupText1
            anchors.centerIn: parent
            // font.bold: true
            font.pixelSize: 18
            color: "red"
            text: ""
        }
    }
    Rectangle {
        id: popup2
        width: 450
        height: 50
        color: "transparent"
        visible: false
        x: (parent.width - width) / 2 + 10 // 150 - 50/2
        y:parent.height*0.65

        Text {
            id: popupText2
            anchors.centerIn: parent
            // font.bold: true
            font.pixelSize: 18
            color: "red"
            text: ""
        }
    }
    Rectangle {
        id: popup3
        width: 450
        height: 50
        color: "transparent"
        visible: false
        x: (parent.width - width) / 2 + 10 // 150 - 50/2
        y:parent.height*0.369

        Text {
            id: popupText3
            anchors.centerIn: parent
            // font.bold: true
            font.pixelSize: 18
            color: "green"
            text: ""
        }

        Timer {
            id: popupTimer3
            interval: 1500
            onTriggered: popup3.visible = false
        }

    }
    Rectangle {
        id: errorLabelContainer
        anchors {
            horizontalCenter: parent.horizontalCenter - 10
            top: parent.top
            topMargin: -90
        }
        visible: false

        Rectangle {
            width: 530
            height: 50
            color: "#ff6347"
            radius: 8

            Text {
                id: errorLabel
                text: errorLabel.text
                color: "black"
                anchors.centerIn: parent
                font.bold: parent
                font.pixelSize: 14
            }
        }
    }

    // Move showErrorLabel function to a global context
    function showErrorLabel(errorMessage) {
        errorLabel.text = errorMessage;
        errorLabelContainer.visible = true;
    }

    function onFileTransferFailed(error) {
        showErrorLabel(error);
    }

    Connections {
        target: fileTransfer
        onErrorOccurred: showErrorLabel(error)
    }
}
