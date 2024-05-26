import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
import QtQuick.Dialogs
//import com.mycompany.qmlcomponents
import AiraaTextFieldPlugin 1.0
import AiraaButtonPlugin 1.0
import AiraaComboBoxPlugin 1.0
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
    signal communicationChanges()

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
                    anchors.centerIn: parent



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
                            width:parent.width
                            //anchors.left: parent.left
                            //anchors.leftMargin: 10
                            spacing: 10
                            Text {
                                x: Math.round(10*scalefactor)
                                id: protocolTextId1
                                text: qsTr("Channel")
                                font.family: "Helvetica"
                                color: "#BABDC0"
                                font.pointSize: Screen.height * 0.017
                                anchors.verticalCenter: parent.verticalCenter
                                leftPadding: 10

                            }
                            AiraaComboBox
                            {
                                id: protocolComboId
                                anchors{
                                    left: protocolTextId1.right
                                    //verticalCenter:protocolTextId1.verticalCenter
                                    top:protocolTextId1.top
                                    leftMargin:20
                                }
                                visible: true
                                width: Math.round(200*scalefactor)
                                //anchors.verticalCenter: parent.verticalCenter

                                modelList: ["Select", "RS232"]/*, "I2C", "SPI"*/
                                controlTextColor:"white"

                                controlPopupTextColor:"#313235"
                                comboBoxHeight:40
                                comboBoxWidth:250
                                textFontFamily: "Helvetica"
                                textFontPixel: Screen.height * 0.017
                                comboTextFontPixel:Screen.height * 0.02
                                comboTxtFont:"Helvetica"
                                // delegate: ItemDelegate{
                                //     text: modelData
                                //     font.pointSize: Screen.height * 0.017
                                //     width: parent.width
                                //     font.family:
                                // }
                                currentIndex: 0

                                onCurrentIndexChanged: {
                                    windowid.communicationChanges()
                                }

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
                                    anchors.centerIn: parent
                                    anchors.fill:parent
                                    spacing: 0
                                    Rectangle{
                                        id:rect

                                        Layout.preferredHeight: 200
                                        Layout.fillWidth: true
                                        Layout.alignment: Qt.AlignTop
                                        Layout.topMargin: 200
                                        color: "transparent"


                                        ColumnLayout{
                                            anchors.centerIn: parent

                                            Row{
                                                spacing:0
                                                Text {
                                                    id:textPortNumberId
                                                    text: "Port Number"
                                                    color: "#BABDC0"
                                                    font.family: "Helvetica"
                                                    font.pointSize: Screen.height * 0.017
                                                    width: Math.round(190*scalefactor)

                                                }
                                                AiraaTextField {
                                                    id: portNameTextField
                                                    height: Math.round(60*scalefactor)
                                                    width: Math.round(260*scalefactor)
                                                    textBoxBorderColor: "#878C92"
                                                    textBoxBorderColorOnFocus:"#8059E8"
                                                    textBoxBorderWidth: 2
                                                    textBoxRadius:4
                                                    textBoxPlaceholderText:"Enter Port Number . . ."
                                                    textBoxTextColor: "#FAFBFD"
                                                    textBoxColor: "#373B3D"
                                                    property bool invalidInput: false
                                                    property var pattern: /^[a-zA-Z0-9\/]*$/
                                                    onEditFinished:
                                                    {
                                                        console.log("editFinished",textBoxString)
                                                        //var pattern = /^[a-zA-Z0-9\/]*$/;
                                                        //portNameTextField.invalidInput = !text.startsWith("/") || !pattern.test(text);
                                                        var pattern = /^[a-zA-Z0-9]*$/;
                                                        portNameTextField.invalidInput = !pattern.test(textBoxString);
                                                        if (portNameTextField.invalidInput && !hasFocus) {
                                                            border.color = "red";
                                                            showPopup2("Invalid Input", "transparent");
                                                        } else {
                                                            border.color = "#CCCCCC";
                                                            //popup2.visible = false;
                                                            //popupText.visible = true;
                                                        }
                                                    }
                                                }

                                            }
                                            Row{

                                                spacing: 0
                                                Text {
                                                    id:textFrequencyId
                                                    text: "Frequency"
                                                    color: "#BABDC0"
                                                    font.family: "Helvetica"
                                                    font.pointSize: Screen.height * 0.017
                                                    width: Math.round(190*scalefactor)

                                                }
                                                AiraaTextField {
                                                    id: baudRateTextField
                                                    height:Math.round(60*scalefactor)
                                                    width: Math.round(260*scalefactor)
                                                    textBoxBorderColor: "#878C92"
                                                    textBoxBorderColorOnFocus:"#8059E8"
                                                    textBoxBorderWidth: 2
                                                    textBoxRadius:4
                                                    textBoxPlaceholderText:"Enter Frequency . . ."
                                                    textBoxTextColor: "#FAFBFD"
                                                    textBoxColor: "#373B3D"
                                                    onEditFinished:
                                                    {
                                                        console.log("editFinished",textBoxString)
                                                    }
                                                    property bool invalidInput: false

                                                }


                                            }
                                        }
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
                                        console.log("not valid         6666666666",portNameTextField.textBoxString,baudRateTextField.textBoxString)

                                        if (portNameTextField.textBoxString.trim() === "" || baudRateTextField.textBoxString.trim() === "") {
                                            //showPopup("Please provide Port Number and Frequency", "transparent");
                                            console.log("not valid         9999")
                                        } else if (!portPattern.test(portNameTextField.textBoxString) || !frequencyPattern.test(baudRateTextField.textBoxString)) {
                                            //showPopup("Invalid Port Number or Frequency", "transparent");
                                            console.log("not valid")
                                        } else {
                                            // If both inputs are valid, proceed to connect
                                            serialComm.connectSerial(portNameTextField.textBoxString, baudRateTextField.textBoxString);
                                            comunicationMediumSelection.visible=false
                                            fileSection.visible=true
                                            console.log("not valid    -------     6666666666")
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
                                        portNameTextField.textBoxString = ""
                                        baudRateTextField.textBoxString = ""
                                    }
                                }
                            }

                        }
                    }
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

                        Column{
                            anchors.top: parent.top
                            anchors.topMargin: 20
                            spacing: 20
                            Repeater{
                                id:fileLocationtext
                                model:1
                                Row {
                                    spacing: index<9?12:10

                                    Text {
                                        id: file5id
                                        text: " File "+(index+1)+":"
                                        font.pointSize: 13
                                        font.family: "Helvetica"
                                        color: "white"
                                    }
                                    Frame {
                                        id: rect5id
                                        width: Math.round(525*scalefactor)
                                        height: 29
                                        background: Rectangle{
                                            color: "transparent"
                                            border.width: 2
                                            border.color: selectedFilePathLabel.visible ? "#c6c6cc":"#636366"
                                        }

                                        Rectangle {
                                            width: parent.width
                                            height: parent.height
                                            color: "transparent"  // Set your desired background color here
                                            border.color: "transparent"  // Initially set border color to transparent

                                            Label {
                                                id: selectedFilePathLabel
                                                text: ""
                                                color: "#f8f8ff"
                                                visible: text===""?false:true
                                                y: -6
                                                font.pointSize: 13
                                                elide: Text.ElideMiddle // Adding the elide property
                                                width: Math.round(480 * scalefactor) // Adjusting the width to fit within the frame
                                            }

                                            Button {
                                                id: btn5
                                                width: 27
                                                height: 23
                                                y: -9
                                                x: 480
                                                ToolTip.delay: 1000
                                                ToolTip.visible: hovered
                                                ToolTip.text: "Add file that is to be flashed"
                                                font.family: "Helvetica"

                                                Image {
                                                    id: dwn5arid
                                                    source: "qrc:/UUU_Tool/Image/Fileicon.png"
                                                    width: 27
                                                    height: 23
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
                                                        rect5id.border.color = "red";  // Set border color to red after file selection
                                                    }
                                                    onRejected: {
                                                        console.log("File selection canceled");
                                                    }
                                                }
                                            }


                                        }
                                    }

                                    Button {
                                        id: clear
                                        width: 30
                                        height: 27

                                        ToolTip.delay: 1000
                                        ToolTip.visible: hovered
                                        ToolTip.text: "Clears the attached file"

                                        Image {
                                            id: clear5id
                                            source: "qrc:/UUU_Tool/Image/clear.png"
                                            width: 30
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


                        Rectangle{
                            id:selectedFileBton
                            Layout.fillHeight: true
                            Layout.preferredWidth: 100
                            color: "transparent"
                            Button {
                                id: addButton
                                enabled:(fileLocationtext.model<8)?true:false
                                anchors.top: parent.top
                                anchors.topMargin: 18
                                anchors.right: selectedFileBton.right
                                // anchors.left: left

                                // anchors.horizontalCenter:parent.horizontalCenter



                                height: Math.round(30 * scalefactor)
                                width: Math.round(50 * scalefactor)

                                background: Rectangle{
                                    height:35
                                    width:80
                                    radius: 5
                                    color: enabled ? "#8059E8" : "#373B3D"
                                    border.color: "black"
                                    border.width: 1
                                    Text {
                                        text: "Add"
                                        font.family: "Helvetica"
                                        font.pointSize: Screen.height * 0.015
                                        font.bold: true
                                        color: enabled ? "#313235" : "#8059E8"
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
                                anchors.centerIn: parent

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
                                        progresspopup.open();
                                        progressrect.visible = true;
                                        progressBar.value = 0;
                                        successText.visible = false;
                                        progressrect.progressCompleted = false;
                                        progressTimer.start();
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



                        }
                    }

                }




            }

        }
    }

    Popup {
        id: progresspopup
        visible: false
        height: 300
        width: 500
        modal: true
        closePolicy: Popup.NoAutoClose
        x: (parent.width - width) / 2
        y: parent.height - height - 20

        background: Rectangle {
            color: "transparent"
        }

        contentItem:    Item {
            id: progressrect
            width: 650
            visible: false
            // anchors.horizontalCenter: parent.horizontalCenter
            // anchors.bottom: parent.bottom
            // anchors.bottomMargin: 250

            property bool progressCompleted: false

            Rectangle {
                id: r1
                width: 650
                height: 250
                border.color: "black"
                border.width: 1
                color: "#373B3D"
                radius: 8
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 48

                Rectangle {
                    id: r2
                    width: parent.width - 1
                    height: 31
                    color: "#2B2D2E"
                    radius: 8

                    ColumnLayout {
                        anchors.fill: parent
                        spacing: 10

                        RowLayout {
                            Layout.fillWidth: true
                            height: 32

                            Text {
                                id: title
                                text: "Progress bar"
                                color: "#BABDC0"
                                verticalAlignment: Text.AlignVCenter
                                font.pointSize: Screen.height * 0.015
                                horizontalAlignment: Text.AlignHCenter
                                Layout.fillWidth: true
                            }

                            Rectangle {
                                id: closerect1
                                height: r2.height - 5
                                width: 30
                                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                                color: "#2B2D2E"

                                Text {
                                    id: closetext1
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
                                        closerect1.color = "#661B20"
                                        closetext1.color = "#B48080"
                                    }
                                    onExited: {
                                        closerect1.color = "#2B2D2E"
                                        closetext1.color = "white"
                                    }
                                    onClicked: {
                                        progressrect.visible = false;
                                        progresspopup.close();
                                    }
                                }
                            }
                        }
                    }

                    Timer {
                        id: progressTimer
                        interval: 100 // 100 ms
                        repeat: true
                        running: false
                        onTriggered: {
                            if (progressBar.value < progressBar.to) {
                                progressBar.value += 1;
                            } else {
                                progressTimer.stop();
                                successText.visible = true;
                                progressrect.progressCompleted = true;
                            }
                        }
                    }
                }

                Rectangle {
                    id: progressBarBackground
                    width: parent.width - 120
                    height: 20
                    color: "#555555"
                    radius: 5
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: r2.bottom
                    anchors.topMargin: 40

                    Rectangle {
                        id: progressBarIndicator
                        width: progressBarBackground.width * (progressBar.value / progressBar.to)
                        height: parent.height
                        color: "#00f700"
                        radius: 5
                    }
                }

                ProgressBar {
                    id: progressBar
                    from: 0
                    to: 100
                    value: 0
                    visible: false
                }

                Text {
                    id: progressText
                    text: progressBar.value + " %"
                    color: "#BABDC0"
                    font.pixelSize: 16
                    anchors.verticalCenter: progressBarBackground.verticalCenter
                    anchors.left: progressBarBackground.right
                    anchors.leftMargin: 10
                }

                Text {
                    id: successText
                    text: "Successfully transmitted"
                    color: "#00f700"
                    font.pixelSize: 17
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: progressBarBackground.bottom
                    anchors.topMargin: 40
                    visible: false
                }

                RowLayout {
                    id: buttonsRow
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: successText.bottom
                    anchors.topMargin: 40
                    spacing: 10

                    Button {
                        id: abortButton
                        Text {
                            text: "Abort"
                            font.family: "Helvetica"
                            font.pointSize: Screen.height * 0.015
                            font.bold: true
                            color: enabled ? "#313235" : "#8059E8"
                            anchors.centerIn: parent
                        }
                        Layout.preferredWidth: 150
                        Layout.preferredHeight: 50
                        background: Rectangle {
                            radius: 5
                            color: enabled ? "#8059E8" : "#373B3D"
                            border.color: "#8059E8"
                            border.width: 2
                        }
                        onClicked: {
                            progressTimer.stop();
                        }
                        enabled: progressTimer.running
                    }

                    Button {
                        id: retryButton
                        Text {
                            text: "Retry"
                            font.family: "Helvetica"
                            font.pointSize: Screen.height * 0.015
                            font.bold: true
                            color: enabled ? "#313235" : "#8059E8"
                            anchors.centerIn: parent
                        }
                        Layout.preferredWidth: 150
                        Layout.preferredHeight: 50
                        background: Rectangle {
                            radius: 5
                            color: enabled ? "#8059E8" : "#373B3D"
                            border.color: "#8059E8"
                            border.width: 2
                        }
                        onClicked: {
                            progressBar.value = 0;
                            successText.visible = false;
                            progressTimer.start();
                            progressrect.progressCompleted = false;
                        }
                        enabled: !progressTimer.running && !progressrect.progressCompleted
                    }

                    Button {
                        id: closeButton
                        Text {
                            text: "Done"
                            font.family: "Helvetica"
                            font.pointSize: Screen.height * 0.015
                            font.bold: true
                            color: enabled ? "#313235" : "#8059E8"
                            anchors.centerIn: parent
                        }
                        Layout.preferredWidth: 150
                        Layout.preferredHeight: 50
                        background: Rectangle {
                            radius: 5
                            color: enabled ? "#8059E8" : "#373B3D"
                            border.color: "#8059E8"
                            border.width: 2
                        }
                        onClicked: {
                            progressrect.visible = false;
                            progresspopup.close();
                        }
                        enabled: !progressTimer.running
                    }
                }
            }
        }

    }


}
