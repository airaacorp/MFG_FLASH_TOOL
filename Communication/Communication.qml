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
    color:"#313235"
    radius: 8
    property int i: 0
    property int j: 0
    property alias selectedChannel: protocolComboId.currentIndex
    signal communicationChannelClosed()

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
        color:"#373B3D"
        radius: 8
        ColumnLayout{
            id:homePageLayout
            spacing: 0
            anchors.fill:parent
            Rectangle {
                id:barId
                Layout.fillWidth: true
                Layout.preferredHeight:  33
                Layout.alignment: Qt.AlignTop
                radius: 8
                color: "#2B2D2E"
                // Row {
                Text {
                    id: protocolTextId
                    text: qsTr("Communication Channels")
                    font.family: "Helvetica"
                    font.pointSize: Screen.height * 0.017
                    color: "#BABDC0"
                    anchors{

                        left: parent.left
                        verticalCenter: parent.verticalCenter
                        leftMargin: 10
                    }

                }
                Rectangle{
                    id:closerect
                    height:barId.height-5

                    width: 30
                    anchors.right: parent.right
                    anchors.rightMargin: 3
                    anchors.verticalCenter: parent.verticalCenter
                    color:"#2B2D2E"

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
                        onEntered: {
                            closerect.color="#661B20"
                            closetext.color="#B48080"
                        }
                        onExited:{

                            closerect.color="#2B2D2E"
                            closetext.color="white"
                        }
                        onClicked: {
                            windowid.visible = false
                            closerect.visible=false
                            homePage.visible = false
                            windowid.communicationChannelClosed()
                        }
                    }
                }
            }
            Rectangle{
                id:comunicationMediumSelection
                Layout.fillHeight: true
                Layout.fillWidth: true
                color:"#373B3D"
                visible:true
                radius: 8
                ColumnLayout{
                    anchors.fill: parent
                    spacing:0
                    Rectangle{
                        id:comboBoxRect
                        radius: 8
                        Layout.preferredHeight: 50
                        Layout.fillWidth: true
                        Layout.alignment: Qt.AlignTop
                        Layout.topMargin: 10
                        color: "transparent"
                        Row{
                            height: 50
                            width:300
                            anchors.left: parent.left
                            anchors.leftMargin: 10
                            spacing: 10
                            Text {
                                x: Math.round(10*scalefactor)
                                id: protocolTextId1
                                text: qsTr("Communication Channel")
                                font.family: "Helvetica"
                                color: "#BABDC0"
                                font.pointSize: Screen.height * 0.017
                                anchors.verticalCenter: parent.verticalCenter


                            }
                            ComboBox
                            {
                                id: protocolComboId
                                visible: true
                                width: Math.round(200*scalefactor)
                                anchors.verticalCenter: parent.verticalCenter
                                model: ["Select", "RS232"]/*, "I2C", "SPI"*/
                                font.family: "Helvetica"
                                font.pointSize: Screen.height * 0.017

                                delegate: ItemDelegate{
                                    text: modelData
                                    font.pointSize: Screen.height * 0.017
                                    width: parent.width
                                    font.family: "Helvetica"
                                }
                                currentIndex: 0

                            }
                        }
                    }
                    Rectangle{
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        color: "transparent"
                        RowLayout{
                            anchors.fill: parent
                            Rectangle{
                                id:noselectionScreen
                                height:parent.height
                                width: parent.width
                                color: "transparent"
                                visible:windowid.selectedChannel===0?true:false
                            }
                            Rectangle{
                                id:rs232Selected
                                Layout.preferredHeight: parent.height
                                Layout.preferredWidth: parent.width
                                color:"transparent"
                                visible:windowid.selectedChannel===1?true:false
                                ColumnLayout{
                                    anchors.fill: parent
                                    spacing:4
                                    Row {
                                        spacing: Math.round(5 * scalefactor)
                                        Layout.alignment: Qt.AlignHCenter|Qt.AlignTop
                                        Layout.topMargin: 120
                                        Text {
                                            text: "Port Number:"
                                            color: "#BABDC0"
                                            font.family: "Helvetica"
                                            anchors.verticalCenter: parent.verticalCenter
                                            font.pointSize: Screen.height * 0.017
                                            width: Math.round(190*scalefactor)
                                        }
                                        AiraaTextField {
                                            id: portNameTextField
                                            anchors.verticalCenter: parent.verticalCenter
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
                                                //var pattern = /^[a-zA-Z0-9\/]*$/;
                                                //portNameTextField.invalidInput = !text.startsWith("/") || !pattern.test(text);
                                                var pattern = /^[a-zA-Z0-9]*$/;
                                                portNameTextField.invalidInput = !pattern.test(text);
                                                if (portNameTextField.invalidInput && !hasFocus) {
                                                    border.color = "red";
                                                    showPopup2("Invalid Input", "transparent");
                                                } else {
                                                    border.color = "#CCCCCC";
                                                    //popup2.visible = false;
                                                    //popupText.visible = true;
                                                }
                                            }
                                            property bool invalidInput: false
                                            property var pattern: /^[a-zA-Z0-9\/]*$/
                                        }
                                    }

                                    Row {
                                        spacing: Math.round(5 * scalefactor)
                                        Layout.alignment: Qt.AlignHCenter
                                        Text {
                                            text: "Frequency:"
                                            font.family: "Helvetica"
                                            color: "#BABDC0"
                                            font.pointSize: Screen.height * 0.017
                                            anchors.verticalCenter: parent.verticalCenter
                                            width: Math.round(190*scalefactor)
                                        }
                                        AiraaTextField {
                                            id: baudRateTextField
                                            anchors.verticalCenter: parent.verticalCenter
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

                                            }
                                            property bool invalidInput: false
                                        }
                                    }
                                    Rectangle{
                                        id:messageBlock
                                        Layout.preferredHeight: 200
                                        Layout.fillWidth: true
                                        color: "transparent"
                                    }
                                }

                            }
                        }
                    }
                    Rectangle{
                        id:buttonRect
                        Layout.preferredHeight: 80
                        Layout.fillWidth: true
                        Layout.alignment: Qt.AlignBottom
                        color: "transparent"
                        Rectangle{
                            height:parent.height
                            width:buttonLayout.width
                            anchors.right: parent.right
                            anchors.rightMargin: 10
                            color: "transparent"
                            RowLayout{

                                id:buttonLayout

                                Button {
                                    id: proceedButton
                                    enabled:(windowid.selectedChannel>0)?true:false
                                    Text {
                                        text: "Connect"
                                        font.family: "Helvetica"
                                        font.pointSize: Screen.height * 0.015
                                        font.bold: true
                                        color: enabled ? "#313235" : "#8059E8"
                                        anchors.centerIn: parent
                                    }
                                    Layout.preferredWidth: Math.round(200 * scalefactor)
                                    Layout.preferredHeight: Math.round(60 * scalefactor)
                                    height: Math.round(60 * scalefactor)
                                    width: Math.round(200 * scalefactor)

                                    background: Rectangle{
                                        radius: 12
                                        color: enabled?  "#8059E8" : "#373B3D"
                                        border.color:  "#8059E8"
                                        border.width: 2
                                    }
                                    onClicked: {
                                        //var portPattern = /^[a-zA-Z0-9\/]*$/;
                                        var portPattern = /^[a-zA-Z0-9]*$/;
                                        var frequencyPattern = /^[0-9]*$/;

                                        if (portNameTextField.text.trim() === "" || baudRateTextField.text.trim() === "") {
                                            //showPopup("Please provide Port Number and Frequency", "transparent");
                                        } else if (!portPattern.test(portNameTextField.text) || !frequencyPattern.test(baudRateTextField.text)) {
                                            //showPopup("Invalid Port Number or Frequency", "transparent");
                                            console.log("not valid")
                                        } else {
                                            // If both inputs are valid, proceed to connect
                                            serialComm.connectSerial(portNameTextField.text, baudRateTextField.text);
                                            comunicationMediumSelection.visible=false
                                            fileSection.visible=true
                                            //rhomePage.visible = false;
                                        }
                                    }
                                }
                                Button {
                                    id: cancelButton


                                    Text {
                                        id:txt
                                        text:"Clear"
                                        font.family: "Helvetica"
                                        font.pointSize: Screen.height * 0.015
                                        font.bold: true
                                        color: "#8059E8"
                                        anchors.centerIn: parent
                                    }
                                    Layout.preferredWidth: Math.round(200 * scalefactor)
                                    Layout.preferredHeight: Math.round(60 * scalefactor)
                                    height: Math.round(60 * scalefactor)
                                    width: Math.round(200 * scalefactor)
                                    background: Rectangle{
                                        radius: 12
                                        color: "transparent"
                                        border.color: "#8059E8"
                                        border.width: 2
                                    }
                                    onClicked: {
                                        portNameTextField.text = ""
                                        baudRateTextField.text = ""
                                    }
                                }
                            }

                        }}
                }
            }
            Rectangle{
                id:fileSection
                Layout.fillHeight: true
                Layout.fillWidth: true
                visible: false
                color:"#373B3D"
                ColumnLayout{

                    anchors.fill:parent
                    spacing:0

                RowLayout{
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    spacing: 0
                    Rectangle{
                        id:selectedFileListRect
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        color: "transparent"
                        Column{
                            anchors.top: parent.top
                            anchors.topMargin: 50
                            spacing: 20
                            Repeater{
                                id:fileLocationtext
                                model:1
                                Row {
                                    spacing: index<9?12:10

                                    Text {
                                        id: file5id
                                        text: "Select File "+(index+1)+":"
                                        font.pointSize: 13
                                        font.family: "Helvetica"
                                        color: "white"
                                    }

                                    Frame {
                                        id: rect5id
                                        width: Math.round(525*scalefactor)
                                        height: 33

                                        Label {
                                            id: selectedFilePathLabel
                                            text: ""
                                            color: "#d9d9d9"
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
                                                   //selectedFilePathLabel.visible = true
                                                    selectedFilePathLabel.text = selectedFile
                                                    console.log("You chose: ", selectedFile)
                                                }
                                                onRejected: {
                                                    console.log("File selection canceled");
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

                                        Image {
                                            id: clear5id
                                            source: "qrc:/UUU_Tool/Image/clear.png"
                                            width: 27
                                            height: 27
                                            anchors.centerIn: clear
                                        }

                                        onClicked: {
                                            selectedFilePathLabel.text = ""
                                        }
                                    }
                                }



                            }
                        }

                    }
                    Rectangle{
                        id:selectedFileBton
                        Layout.fillHeight: true
                        Layout.preferredWidth: 100
                        color: "transparent"
                        Button {
                            id: addButton
                            enabled:(fileLocationtext.model<10)?true:false
                            anchors.top: parent.top
                            anchors.topMargin: 50
                            anchors.horizontalCenter:parent.horizontalCenter



                            height: Math.round(30 * scalefactor)
                            width: Math.round(50 * scalefactor)

                            background: Rectangle{
                                height:30
                                width:50
                                radius: 5
                                color: enabled?  "#B39CF1" : "#777d89"
                                border.color: "black"
                                border.width: 1
                                Text {
                                    text: "add"
                                    font.family: "Helvetica"
                                    font.pointSize: Screen.height * 0.015
                                    font.bold: true
                                    color: enabled ? "#313235" : "#FFFFFF"
                                    anchors.centerIn: parent
                                }
                            }
                            onClicked: {
                                    fileLocationtext.model=fileLocationtext.model+1
                            }
                        }



                    }
                }
                Rectangle{
                    id:hhh
                    Layout.preferredHeight: 80
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignBottom
                    color: "transparent"
                    Rectangle{
                        height:parent.height
                        width:buttonLayout.width
                        anchors.right: parent.right
                        anchors.rightMargin: 10
                        color: "transparent"
                        RowLayout{

                            id:fileSelectionButtonRect

                            Button {
                                id: transmitButton
                                enabled:(windowid.selectedChannel>0)?true:false
                                Text {
                                    text: "Transmit"
                                    font.family: "Helvetica"
                                    font.pointSize: Screen.height * 0.015
                                    font.bold: true
                                    color: enabled ? "#313235" : "#FFFFFF"
                                    anchors.centerIn: parent
                                }
                                Layout.preferredWidth: Math.round(200 * scalefactor)
                                Layout.preferredHeight: Math.round(60 * scalefactor)
                                height: Math.round(60 * scalefactor)
                                width: Math.round(200 * scalefactor)

                                background: Rectangle{
                                    radius: 12
                                    color: enabled?  "#B39CF1" : "#777d89"
                                    border.color: "black"
                                    border.width: 1
                                }
                                onClicked: {
                                    console.log("transmit button clicked")
                                }
                            }
                            Button {
                                id: clearButton
                                Text {
                                    id:clearText
                                    text:"Clear"
                                    font.family: "Helvetica"
                                    font.pointSize: Screen.height * 0.015
                                    font.bold: true
                                    color: "white"
                                    anchors.centerIn: parent
                                }
                                Layout.preferredWidth: Math.round(200 * scalefactor)
                                Layout.preferredHeight: Math.round(60 * scalefactor)
                                height: Math.round(60 * scalefactor)
                                width: Math.round(200 * scalefactor)
                                background: Rectangle{
                                    radius: 12
                                    color: "#777f8c"
                                    border.color: "black"
                                    border.width: 1
                                }
                                onClicked: {
                                    portNameTextField.text = ""
                                    baudRateTextField.text = ""
                                    console.log("clear button clicked")
                                }
                            }
                        }

                    }}

                }
            }
        }
    }

}
