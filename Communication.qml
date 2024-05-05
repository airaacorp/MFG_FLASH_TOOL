import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
import QtQuick.Dialogs
//import com.mycompany.qmlcomponents
import AiraaTextFieldPlugin 1.0
import AiraaButtonPlugin 1.0

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
    property int i: 0
    property int j: 0

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
                        closerect.visible=false
                        homePage1.visible = false
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
                            homePage1.visible =false
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
                    source: "qrc:/UUU_Tool/Image/BackButton.png"
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
                    AiraaTextField {
                        id: portNameTextField
                        onHoveredChanged: {
                            if(hovered) {
                                if (!portNameTextField.focus && !portNameTextField.invalidInput)
                                    background.color = "#E0E0E0";
                            }
                            else {
                                if (!portNameTextField.focus && !portNameTextField.invalidInput)
                                    background.color = "#F8F8FF";
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

                Row {
                    spacing: Math.round(5 * scalefactor)
                    Text {
                        text: "Frequency:"
                        font.family: "Helvetica"
                        font.pointSize: Screen.height * 0.017
                        width: Math.round(190*scalefactor)
                    }
                    AiraaTextField {
                        id: baudRateTextField
                        onHoveredChanged: {
                            if(hovered) {
                                if (!portNameTextField.focus && !portNameTextField.invalidInput)
                                    background.color = "#E0E0E0";
                            }
                            else {
                                if (!portNameTextField.focus && !portNameTextField.invalidInput)
                                    background.color = "#F8F8FF";
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
        }

        AiraaButton {
            id: connectButton
            text: "Connect"
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
                    // sendDataButton.visible = true;
                    // closeSerialButton.visible = true;
                    connectButton.visible = false;
                    homePage1.visible = true;
                    showPopup3("Connected successfully", "transparent");
                }
            }
        }


        Rectangle {
            id:homePage1
            anchors.fill: parent
            border.width: 1
            color: "white"
            Button {
                id:bb1
                height: Math.round(40*scalefactor)
                width: Math.round(40*scalefactor)
                y:Math.round(20* scalefactor)
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
                    id: bbimage1
                    height: Math.round(40*scalefactor)
                    width: Math.round(40*scalefactor)
                    source: "qrc:/UUU_Tool/Image/BackButton.png"
                }
                contentItem: Text {
                    text: bb.text
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                }
                onClicked: {
                    // homePage.visible = true
                    homePage1.visible = false
                    deviceRect.visible = true
                    connectButton.visible = true
                }

            }
            Column {
                spacing: 26
                y: 70
                x: 10
                Row {
                    spacing: 12

                    Row {
                        id: rowid1
                        spacing: 10

                        Text {
                            id: file1id
                            text: "Select File 1: "
                            font.family: "Helvetica"
                            font.pointSize: 13
                        }

                        Frame {
                            id: rect1id
                            // width: 550
                            // height: 33
                            height: Math.round(33*scalefactor)
                            width: Math.round(525*scalefactor)

                            Label {
                                id: selectedFilePathLabel1
                                text: ""
                                y: -6
                                font.pointSize: 13
                            }

                            Button {
                                id: btn1
                                // width: 30
                                // height: 27
                                height: Math.round(27*scalefactor)
                                width: Math.round(30*scalefactor)
                                x: 480
                                y: -9

                                ToolTip.delay: 1000
                                ToolTip.visible: hovered
                                ToolTip.text: "Add file that is to be flashed"
                                font.family: "Helvetica"

                                Image {
                                    id: dwn1arid
                                    source: "qrc:/UUU_Tool/Image/Downarrow.png"
                                    width: 27
                                    height: 25
                                    anchors.centerIn: btn1
                                }

                                onClicked: fileDialog1.open()

                                FileDialog {
                                    id: fileDialog1
                                    title: "Choose File"
                                    onAccepted: {
                                        var file1 = fileDialog1.fileUrls;
                                        selectedFilePathLabel1.visible = true
                                        selectedFilePathLabel1.text = selectedFile
                                        console.log("You chose: ", selectedFile)
                                    }
                                    onRejected: {
                                        console.log("File selection canceled")
                                    }
                                }
                            }
                        }
                    }

                    Button {
                        id: clear
                        width: 30
                        height: 30

                        ToolTip.delay: 1000
                        ToolTip.visible: hovered
                        ToolTip.text: "Clears the attached file"
                        font.family: "Helvetica"

                        Image {
                            id: clearid
                            source: "qrc:/UUU_Tool/Image/clear.png"
                            width: 27
                            height: 27
                            anchors.centerIn: clear
                        }

                        onClicked: {
                            selectedFilePathLabel1.visible = false
                        }
                    }

                    Button {
                        text: "Add"
                        width: 65
                        height: 35
                        font.pointSize: 13

                        ToolTip.delay: 1000
                        ToolTip.visible: hovered
                        ToolTip.text: "Adds more files"
                        font.family: "Helvetica"


                        onClicked: {
                            i++
                            if(i === 1) {
                                rowid7.visible = true
                            } else if (i === 2) {
                                rowid8.visible = true
                            } else if (i === 3) {
                                rowid9.visible = true
                            } else if (i === 4) {
                                rowid10.visible = true
                                i = 0;
                            }
                        }
                    }
                }

                Row {
                    spacing: 12

                    Row {
                        spacing: 12

                        Text {
                            id: file2id
                            text: "Select File 2: "
                            font.pointSize: 13
                            font.family: "Helvetica"
                        }

                        Frame {
                            id: rect2id
                            width: Math.round(525*scalefactor)
                            height: 33

                            Label {
                                id: selectedFilePathLabel2
                                text: ""
                                y: -6
                                font.pointSize: 13
                            }

                            Button {
                                id: btn2
                                width: 30
                                height: 27
                                x: 480
                                y: -9

                                ToolTip.delay: 1000
                                ToolTip.visible: hovered
                                ToolTip.text: "Add file that is to be flashed"
                                font.family: "Helvetica"

                                Image {
                                    id: dwn2arid
                                    source: "qrc:/UUU_Tool/Image/Downarrow.png"
                                    width: 27
                                    height: 25
                                    anchors.centerIn: btn2
                                }

                                onClicked: fileDialog2.open()

                                FileDialog {
                                    id: fileDialog2
                                    title: "Choose File"
                                    onAccepted: {
                                        var file1 = fileDialog2.fileUrls;
                                        selectedFilePathLabel2.visible = true
                                        selectedFilePathLabel2.text = selectedFile
                                        console.log("You chose: ", selectedFile)
                                    }

                                    onRejected: {
                                        console.log("File selection canceled");
                                    }
                                }
                            }
                        }
                    }

                    Button {
                        id: clear2
                        width: 30
                        height: 30

                        ToolTip.delay: 1000
                        ToolTip.visible: hovered
                        ToolTip.text: "Clears the attached file"
                        font.family: "Helvetica"

                        Image {
                            id: clear2id
                            source: "qrc:/UUU_Tool/Image/clear.png"
                            width: 27
                            height: 27
                            anchors.centerIn: clear2
                        }

                        onClicked: {
                            selectedFilePathLabel2.visible = false
                        }
                    }

                    Button {
                        text: "Clear"
                        width: 63
                        height: 35
                        font.pointSize: 13

                        ToolTip.delay: 1000
                        ToolTip.visible: hovered
                        ToolTip.text: "Clears the files that are not used"
                        font.family: "Helvetica"

                        onClicked: {
                            j++
                            if(j === 4) {
                                rowid7.visible = false
                                selectedFilePathLabel7.visible = false
                                j = 0;
                            } else if (j === 3) {
                                rowid8.visible = false
                                selectedFilePathLabel8.visible = false
                            } else if (j === 2) {
                                rowid9.visible = false
                                selectedFilePathLabel9.visible = false
                            } else if (j === 1) {
                                rowid10.visible = false
                                selectedFilePathLabel10.visible = false
                            }
                        }
                    }
                }

                Row {
                    spacing: 12

                    Text {
                        id: file3id
                        text: "Select File 3: "
                        font.pointSize: 13
                        font.family: "Helvetica"
                    }

                    Frame {
                        id: rect3id
                        width: Math.round(525*scalefactor)
                        height: 33

                        Label {
                            id: selectedFilePathLabel3
                            text: ""
                            y: -6
                            font.pointSize: 13
                        }

                        Button {
                            id: btn3
                            width: 30
                            height: 27
                            x: 480
                            y: -9

                            ToolTip.delay: 1000
                            ToolTip.visible: hovered
                            ToolTip.text: "Add file that is to be flashed"
                            font.family: "Helvetica"

                            Image {
                                id: dwn3arid
                                source: "qrc:/UUU_Tool/Image/Downarrow.png"
                                width: 27
                                height: 25
                                anchors.centerIn: btn3
                            }

                            onClicked: fileDialog3.open()

                            FileDialog {
                                id: fileDialog3
                                title: "Choose File"
                                onAccepted: {
                                    var file1 = fileDialog3.fileUrls;
                                    selectedFilePathLabel3.visible = true
                                    selectedFilePathLabel3.text = selectedFile
                                    console.log("You chose: ", selectedFile)
                                }
                                onRejected: {
                                    console.log("File selection canceled");
                                }
                            }
                        }
                    }

                    Button {
                        id: clear3
                        width: 30
                        height: 30

                        ToolTip.delay: 1000
                        ToolTip.visible: hovered
                        ToolTip.text: "Clears the attached file"
                        font.family: "Helvetica"

                        Image {
                            id: clear3id
                            source: "qrc:/UUU_Tool/Image/clear.png"
                            width: 27
                            height: 27
                            anchors.centerIn: clear3
                        }

                        onClicked: {
                            selectedFilePathLabel3.visible = false
                        }
                    }
                }

                Row {
                    spacing: 12

                    Text {
                        id: file4id
                        text: "Select File 4: "
                        font.pointSize: 13
                        font.family: "Helvetica"
                    }

                    Frame {
                        id: rect4id
                        width: Math.round(525*scalefactor)
                        height: 33

                        Label {
                            id: selectedFilePathLabel4
                            text: ""
                            y: -6
                            font.pointSize: 13
                        }

                        Button {
                            id: btn4
                            width: 30
                            height: 27
                            x: 480
                            y: -9

                            ToolTip.delay: 1000
                            ToolTip.visible: hovered
                            ToolTip.text: "Add file that is to be flashed"
                            font.family: "Helvetica"

                            Image {
                                id: dwnarid
                                source: "qrc:/UUU_Tool/Image/Downarrow.png"
                                width: 27
                                height: 25
                                anchors.centerIn: btn4
                            }

                            onClicked: fileDialog4.open()

                            FileDialog {
                                id: fileDialog4
                                title: "Choose File"
                                onAccepted: {
                                    var file1 = fileDialog4.fileUrls;
                                    selectedFilePathLabel4.visible = true
                                    selectedFilePathLabel4.text = selectedFile
                                    console.log("You chose: ", selectedFile)
                                }
                                onRejected: {
                                    console.log("File selection canceled");
                                }
                            }
                        }
                    }

                    Button {
                        id: clear4
                        width: 30
                        height: 30

                        ToolTip.delay: 1000
                        ToolTip.visible: hovered
                        ToolTip.text: "Clears the attached file"
                        font.family: "Helvetica"

                        Image {
                            id: clear4id
                            source: "qrc:/UUU_Tool/Image/clear.png"
                            width: 27
                            height: 27
                            anchors.centerIn: clear4
                        }

                        onClicked: {
                            selectedFilePathLabel4.visible = false
                        }
                    }
                }

                Row {
                    spacing: 12

                    Text {
                        id: file5id
                        text: "Select File 5: "
                        font.pointSize: 13
                        font.family: "Helvetica"
                    }

                    Frame {
                        id: rect5id
                        width: Math.round(525*scalefactor)
                        height: 33

                        Label {
                            id: selectedFilePathLabel5
                            text: ""
                            y: -6
                            font.pointSize: 13
                        }

                        Button {
                            id: btn5
                            width: 30
                            height: 27
                            x: 480
                            y: -9

                            ToolTip.delay: 1000
                            ToolTip.visible: hovered
                            ToolTip.text: "Add file that is to be flashed"
                            font.family: "Helvetica"

                            Image {
                                id: dwn5arid
                                source: "qrc:/UUU_Tool/Image/Downarrow.png"
                                width: 27
                                height: 25
                                anchors.centerIn: btn5
                            }

                            onClicked: fileDialog5.open()

                            FileDialog {
                                id: fileDialog5
                                title: "Choose File"
                                onAccepted: {
                                    var file1 = fileDialog5.fileUrls;
                                    selectedFilePathLabel5.visible = true
                                    selectedFilePathLabel5.text = selectedFile
                                    console.log("You chose: ", selectedFile)
                                }
                                onRejected: {
                                    console.log("File selection canceled");
                                }
                            }
                        }
                    }

                    Button {
                        id: clear5
                        width: 30
                        height: 30

                        ToolTip.delay: 1000
                        ToolTip.visible: hovered
                        ToolTip.text: "Clears the attached file"

                        Image {
                            id: clear5id
                            source: "qrc:/UUU_Tool/Image/clear.png"
                            width: 27
                            height: 27
                            anchors.centerIn: clear5
                        }

                        onClicked: {
                            selectedFilePathLabel5.visible = false
                        }
                    }
                }

                Row {
                    spacing: 12

                    Text {
                        id: file6id
                        text: "Select File 6: "
                        font.pointSize: 13
                        font.family: "Helvetica"
                    }

                    Frame {
                        id: rect6id
                        width: Math.round(525*scalefactor)
                        height: 33

                        Label {
                            id: selectedFilePathLabel6
                            text: ""
                            y: -6
                            font.pointSize: 13
                        }

                        Button {
                            id: btn6
                            width: 30
                            height: 27
                            x: 480
                            y: -9

                            ToolTip.delay: 1000
                            ToolTip.visible: hovered
                            ToolTip.text: "Add file that is to be flashed"
                            font.family: "Helvetica"

                            Image {
                                id: dwn6arid
                                source: "qrc:/UUU_Tool/Image/Downarrow.png"
                                width: 27
                                height: 25
                                anchors.centerIn: btn6
                            }

                            onClicked: fileDialog6.open()

                            FileDialog {
                                id: fileDialog6
                                title: "Choose File"
                                onAccepted: {
                                    var file1 = fileDialog6.fileUrls;
                                    selectedFilePathLabel6.visible = true
                                    selectedFilePathLabel6.text = selectedFile
                                    console.log("You chose: ", selectedFile)
                                }
                                onRejected: {
                                    console.log("File selection canceled");
                                }
                            }
                        }
                    }
                    Button {
                        id: clear6
                        width: 30
                        height: 30

                        ToolTip.delay: 1000
                        ToolTip.visible: hovered
                        ToolTip.text: "Clears the attached file"
                        font.family: "Helvetica"

                        Image {
                            id: clear6id
                            source: "qrc:/UUU_Tool/Image/clear.png"
                            width: 27
                            height: 27
                            anchors.centerIn: clear6
                        }

                        onClicked: {
                            selectedFilePathLabel6.visible = false
                        }
                    }
                }

                Row {
                    id: rowid7
                    visible: false
                    spacing: 12

                    Text {
                        id: file7id
                        text: "Select File 7: "
                        font.family: "Helvetica"
                        font.pointSize: 13
                    }

                    Frame {
                        id: rect7id
                        width: Math.round(525*scalefactor)
                        height: 33

                        Label {
                            id: selectedFilePathLabel7
                            text: ""
                            y: -6
                            font.pointSize: 13
                        }

                        Button {
                            id: btn7
                            width: 30
                            height: 27
                            x: 480
                            y: -9

                            ToolTip.delay: 1000
                            ToolTip.visible: hovered
                            ToolTip.text: "Add file that is to be flashed"
                            font.family: "Helvetica"

                            Image {
                                id: dwn7arid
                                source: "qrc:/UUU_Tool/Image/Downarrow.png"
                                width: 27
                                height: 25
                                anchors.centerIn: btn7
                            }

                            onClicked: fileDialog7.open()

                            FileDialog {
                                id: fileDialog7
                                title: "Choose File"
                                onAccepted: {
                                    var file1 = fileDialog7.fileUrls;
                                    selectedFilePathLabel7.visible = true
                                    selectedFilePathLabel7.text = selectedFile
                                    console.log("You chose: ", selectedFile)
                                }

                                onRejected: {
                                    console.log("File selection canceled");
                                }
                            }
                        }
                    }
                    Button {
                        id: clear7
                        width: 30
                        height: 30

                        ToolTip.delay: 1000
                        ToolTip.visible: hovered
                        ToolTip.text: "Clears the attached file"
                        font.family: "Helvetica"

                        Image {
                            id: clear7id
                            source: "qrc:/UUU_Tool/Image/clear.png"
                            width: 27
                            height: 27
                            anchors.centerIn: clear7
                        }

                        onClicked: {
                            selectedFilePathLabel7.visible = false
                        }
                    }
                }

                Row {
                    id: rowid8
                    visible: false
                    spacing: 12

                    Text {
                        id: file8id
                        text: "Select File 8: "
                        font.family: "Helvetica"
                        font.pointSize: 13
                    }

                    Frame {
                        id: rect8id
                        width: Math.round(525*scalefactor)
                        height: 33

                        Label {
                            id: selectedFilePathLabel8
                            text: ""
                            y: -6
                            font.pointSize: 13
                        }

                        Button {
                            id: btn8
                            width: 30
                            height: 27
                            x: 480
                            y: -9

                            ToolTip.delay: 1000
                            ToolTip.visible: hovered
                            ToolTip.text: "Add file that is to be flashed"
                            font.family: "Helvetica"

                            Image {
                                id: dwn8arid
                                source: "qrc:/UUU_Tool/Image/Downarrow.png"
                                width: 27
                                height: 25
                                anchors.centerIn: btn8
                            }

                            onClicked: fileDialog8.open()

                            FileDialog {
                                id: fileDialog8
                                title: "Choose File"
                                onAccepted: {
                                    var file1 = fileDialog8.fileUrls;
                                    selectedFilePathLabel8.visible = true
                                    selectedFilePathLabel8.text = selectedFile
                                    console.log("You chose: ", selectedFile)
                                }

                                onRejected: {
                                    console.log("File selection canceled");
                                }
                            }
                        }
                    }
                    Button {
                        id: clear8
                        width: 30
                        height: 30

                        ToolTip.delay: 1000
                        ToolTip.visible: hovered
                        ToolTip.text: "Clears the attached file"
                        font.family: "Helvetica"

                        Image {
                            id: clear8id
                            source: "qrc:/UUU_Tool/Image/clear.png"
                            width: 27
                            height: 27
                            anchors.centerIn: clear8
                        }

                        onClicked: {
                            selectedFilePathLabel8.visible = false
                        }
                    }
                }

                Row {
                    id: rowid9
                    visible: false
                    spacing: 12

                    Text {
                        id: file9id
                        text: "Select File 9: "
                        font.pointSize: 13
                        font.family: "Helvetica"
                    }

                    Frame {
                        id: rect9id
                        width: Math.round(525*scalefactor)
                        height: 33

                        Label {
                            id: selectedFilePathLabel9
                            text: ""
                            y: -6
                            font.pointSize: 13
                        }

                        Button {
                            id: btn9
                            width: 30
                            height: 27
                            x: 480
                            y: -9

                            ToolTip.delay: 1000
                            ToolTip.visible: hovered
                            ToolTip.text: "Add file that is to be flashed"
                            font.family: "Helvetica"

                            Image {
                                id: dwn9arid
                                source: "qrc:/UUU_Tool/Image/Downarrow.png"
                                width: 27
                                height: 25
                                anchors.centerIn: btn9
                            }

                            onClicked: fileDialog9.open()

                            FileDialog {
                                id: fileDialog9
                                title: "Choose File"
                                onAccepted: {
                                    var file1 = fileDialog9.fileUrls;
                                    selectedFilePathLabel9.visible = true
                                    selectedFilePathLabel9.text = selectedFile
                                    console.log("You chose: ", selectedFile)
                                }

                                onRejected: {
                                    console.log("File selection canceled");
                                }
                            }
                        }
                    }
                    Button {
                        id: clear9
                        width: 30
                        height: 30

                        ToolTip.delay: 1000
                        ToolTip.visible: hovered
                        ToolTip.text: "Clears the attached file"
                        font.family: "Helvetica"

                        Image {
                            id: clear9id
                            source: "qrc:/UUU_Tool/Image/clear.png"
                            width: 27
                            height: 27
                            anchors.centerIn: clear9
                        }

                        onClicked: {
                            selectedFilePathLabel9.visible = false
                        }
                    }
                }

                Row {
                    id: rowid10
                    visible: false
                    spacing: 9

                    Text {
                        id: file10id
                        text: "Select File 10: "
                        font.pointSize: 13
                        font.family: "Helvetica"
                    }

                    Frame {
                        id: rect10id
                        width: Math.round(525*scalefactor)
                        height: 33

                        Label {
                            id: selectedFilePathLabel10
                            text: ""
                            y: -6
                            font.pointSize: 13
                        }

                        Button {
                            id: btn10
                            width: 30
                            height: 27
                            x: 480
                            y: -9

                            ToolTip.delay: 1000
                            ToolTip.visible: hovered
                            ToolTip.text: "Add file that is to be flashed"
                            font.family: "Helvetica"

                            Image {
                                id: dwn10arid
                                source: "qrc:/UUU_Tool/Image/Downarrow.png"
                                width: 27
                                height: 25
                                anchors.centerIn: btn10
                            }

                            onClicked: fileDialog10.open()

                            FileDialog {
                                id: fileDialog10
                                title: "Choose File"
                                onAccepted: {
                                    var file1 = fileDialog10.fileUrls;
                                    selectedFilePathLabel10.visible = true
                                    selectedFilePathLabel10.text = selectedFile
                                    console.log("You chose: ", selectedFile)
                                }

                                onRejected: {
                                    console.log("File selection canceled");
                                }
                            }
                        }
                    }
                    Button {
                        id: clear10
                        width: 30
                        height: 30

                        ToolTip.delay: 1000
                        ToolTip.visible: hovered
                        ToolTip.text: "Clears the attached file"
                        font.family: "Helvetica"

                        Image {
                            id: clear10id
                            source: "qrc:/UUU_Tool/Image/clear.png"
                            width: 27
                            height: 27
                            anchors.centerIn: clear10
                        }

                        onClicked: {
                            selectedFilePathLabel10.visible = false
                        }
                    }
                }
            }

            Row {
                spacing: 10
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 580
                anchors.topMargin: 700

                Button {
                    text: "Attach"
                    font.pointSize: 13
                    width: 80
                    height: 35

                    ToolTip.delay: 1000
                    ToolTip.visible: hovered
                    ToolTip.text: "Attach files that is to be flashed"
                    font.family: "Helvetica"
                }

                Button {
                    property int i: 1
                    text: "Cancel"
                    font.pointSize: 13
                    font.family: "Helvetica"
                    width: 90
                    height: 35

                    ToolTip.delay: 1000
                    ToolTip.visible: hovered
                    ToolTip.text: "Clears all the files that is attached"

                    onClicked: {
                        selectedFilePathLabel1.visible = false
                        selectedFilePathLabel2.visible = false
                        selectedFilePathLabel3.visible = false
                        selectedFilePathLabel4.visible = false
                        selectedFilePathLabel5.visible = false
                        selectedFilePathLabel6.visible = false
                        selectedFilePathLabel7.visible = false
                        selectedFilePathLabel8.visible = false
                        selectedFilePathLabel9.visible = false
                        selectedFilePathLabel10.visible = false
                    }
                }
            }
        }


        // Row {
        //     spacing: Math.round(15 * scalefactor)
        //     anchors {
        //         horizontalCenter: parent.horizontalCenter
        //         bottom: parent.bottom
        //         bottomMargin: Math.round(100 * scalefactor)
        //     }
        //     Button {
        //         id: sendDataButton
        //         Text {
        //             text: "Send Data"
        //             font.family: "Helvetica"
        //             font.pointSize: Screen.height * 0.015
        //             font.bold: true
        //             color: "white"
        //             anchors.centerIn: parent
        //         }
        //         height: Math.round(60*scalefactor)
        //         width: Math.round(200*scalefactor)
        //         background: Rectangle{
        //             radius: 60
        //             color: "#777f8c"
        //         }
        //         visible: serialComm.isPortConnected()
        //         onClicked: {
        //             rowId1.visible = true
        //         }
        //     }
        //     Button {
        //         id: closeSerialButton
        //         Text {
        //             text: "Port Disconnect"
        //             font.family: "Helvetica"
        //             font.pointSize: Screen.height * 0.015
        //             font.bold: true
        //             color: "white"
        //             anchors.centerIn: parent
        //         }
        //         height: Math.round(60*scalefactor)
        //         width: Math.round(260*scalefactor)
        //         background: Rectangle{
        //             radius: 60
        //             color: "#777f8c"
        //         }
        //         visible: serialComm.isPortConnected()
        //         onClicked: {
        //             serialComm.closeSerial()

        //         }
        //     }
        // }
        // Popup {
        //     onClosed: {
        //         dynamicTextField.text = "";
        //         errorLabelContainer.visible = false;
        //     }
        // }

        // Row {
        //     id: rowId1
        //     anchors.bottom: parent.bottom
        //     anchors.bottomMargin: 20
        //     anchors.horizontalCenter: parent.horizontalCenter
        //     spacing: Math.round(5 * scalefactor)
        //     visible: false
        //     TextField {
        //         id: filePathInput
        //         // width: Math.round(500*scalefactor)
        //         width: deviceRect.width-sendFileButton.width-22
        //         height: Math.round(60 * scalefactor)
        //         placeholderText: "Enter file path(s)"
        //     }
        //     Button {
        //         id: sendFileButton
        //         Text {
        //             text: "Send"
        //             font.family: "Helvetica"
        //             font.pointSize: Screen.height * 0.015
        //             font.bold: true
        //             rightPadding: 10
        //             color: "white"
        //             anchors.centerIn: parent
        //         }
        //         height: 60
        //         width: 150
        //         background: Rectangle{
        //             radius: 60
        //             color: "#777f8c"
        //         }
        //         onClicked: {
        //             var paths = filePathInput.text.trim().split(","); // Split input by comma to get multiple paths
        //             if (paths.length === 1 && paths[0] === "") {
        //                 // If the user hasn't entered any paths, display a popup
        //                 popupText2.text = "Please enter a file path.","transparent"
        //                 popup2.visible = true
        //             } else {
        //                 popupText2.visible = false
        //                 for (var i = 0; i < paths.length; i++) {
        //                     var path = paths[i].trim();
        //                     if (path !== "" && path !== undefined) {
        //                         // Sending file or folder
        //                         serialComm.sendFile(path);
        //                     } else {
        //                         // Log error message
        //                         console.log("Please enter a valid file path.");
        //                     }
        //                 }
        //             }
        //         }
        //     }
        //     Connections {
        //         target: fileTransfer
        //         onFileTransferFailed: showErrorLabel(error)
        //         onFileTransferCompleted: console.log("File transfer completed successfully")
        //     }
        // }
    }
    function showSuccessLabel(successMessage) {
        errorLabel.text = successMessage;
        errorLabel.color = "green";
        errorLabelContainer.visible = true;
    }
    // }
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
