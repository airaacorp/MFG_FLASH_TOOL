import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
import QtQuick.Dialogs
import AiraaComboBoxPlugin 1.0

Item {
    id: flashcmdid

    property real scalefactor : {
        if(Screen.width > 1920) return 1.2
        else if(Screen.height < 1080) return 0.8
        else return 1
    }

    height: parent.height
    width: parent.width
    visible: true
    signal flashCommandClosed()
    signal flashChanges()

    Rectangle {
        id: flashwindow
        anchors.fill: parent
        border.color: "black"
        border.width: 1
        color:"#373B3D"
        radius: 8
        ColumnLayout{
            id:homePageLayout
            spacing: 0
            anchors.fill:parent

           Rectangle {
                id:barid
                Layout.fillWidth: true
                Layout.preferredHeight: 33
                Layout.alignment: Qt.AlignTop
                radius: 8
                color: "#2B2D2E"

                Text {
                    id: protocolTextId
                    text: qsTr("Flash File")
                    font.family: "Helvetica"
                    font.pointSize: Screen.height * 0.017
                    color: "#BABDC0"
                    anchors.centerIn: parent
                }

                Rectangle{
                    id:closerectflash
                    height:barid.height-5
                    width: 30
                    anchors.right: parent.right
                    anchors.rightMargin: 3
                    anchors.verticalCenter: parent.verticalCenter
                    color:"#2B2D2E"

                    Text {
                        id: closetextflash
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
                            closerectflash.color="#661B20"
                            closetextflash.color="#B48080"
                        }
                        onExited:{
                            closerectflash.color="#2B2D2E"
                            closetextflash.color="white"
                        }
                        onClicked: {
                            flashcmdid.visible = false
                            closerectflash.visible=false
                            flashcmdid.flashCommandClosed()

                        }
                    }
                }
            }
        }

        ColumnLayout {
            spacing: 15
            y: parent.height * 0.07
            x: parent.width * 0.01
            Row {
                spacing: 10

                Label {
                    id:optionId
                    text: "Options"
                    font.pointSize: Screen.height * 0.017
                    font.family: "Helvetica"
                    color: "white"
                    leftPadding: 10
                }

                AiraaComboBox
                {
                    id: protocolComboId
                    anchors{
                        left: optionId.right
                        top:optionId.top
                        leftMargin:20
                    }
                    visible: true
                    width: Math.round(200*scalefactor)
                    anchors.verticalCenter: parent.verticalCenter
                    modelList: ["Select", "Windows", "Linux"]
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
                    //     font.family: "Helvetica"
                    // }
                    currentIndex: 0


                    onCurrentIndexChanged: {
                        flashcmdid.flashChanges()
                                            if(currentIndex === 0){
                                                if(promtcommandInput.text != ""  || commandInput.text != ""){
                                                    promtcommandInput.clear()
                                                    commandOutput1.clear()
                                                    commandOutput.clear()
                                                    commandInput.clear()
                                                }
                                            }
                                            if (currentIndex === 2) {
                                                linuxTerminal.visible = true
                                                windowsPromt.visible = false
                                            } else if (currentIndex === 1) {
                                                windowsPromt.visible = true
                                                linuxTerminal.visible = false
                                            }else{
                                                if(currentIndex === 0){
                                                    linuxTerminal.visible=false
                                                    windowsPromt.visible=false
                                                }
                                            }
                                        }

                }
            }
            Rectangle {

                            id: linuxTerminal

                            visible: false

                            height: 650/1080 * parent.height

                            width: 750/1920*parent.width

                            color:"#373B3D"

                            Column {

                                anchors.fill:parent

                                spacing: 10

                                Rectangle{

                                    id:linuxtxt

                                    width: 200

                                    height: 30

                                    color:"#373B3D"

                                    Text {

                                        id: linuxid

                                        text: qsTr("Linux Terminal :")

                                        color: "#FFFFFF"

                                        font.pointSize: Screen.height * 0.014

                                    }

                                }

                                Row {

                                    id: rowid

                                    width:flashcmdid.width

                                    height:commandInput.height

                                    spacing: 10

                                    TextField {

                                        id: commandInput

                                        placeholderText: "Enter command..."

                                        font.family: "Helvetica"

                                        width:flashcmdid.width-linuxlanchbutton.width-22

                                    }

                                    Button {

                                        id:linuxlanchbutton

                                        Text {

                                            text: "Run"

                                            font.family: "Helvetica"

                                            font.pointSize: Screen.height * 0.015

                                            font.bold: true

                                            color: enabled ? "#313235" : "#8059E8"

                                            anchors.centerIn: parent

                                        }

                                        Layout.preferredWidth: Math.round(80 * scalefactor)

                                        Layout.preferredHeight: Math.round(35 * scalefactor)

                                        height: Math.round(35 * scalefactor)

                                        width: Math.round(80 * scalefactor)

                                        background: Rectangle{

                                            radius: 2

                                            color: enabled?  "#8059E8" : "#373B3D"

                                            border.color: commandInput.focus ? "#8059E8" : "#FFFFFF" // Change border color when TextField has focus

                                            border.width: 1

                                        }


                                        onClicked: {

                                            launcher.launchCommand(commandInput.text);

                                        }

                                        enabled: commandInput.text.trim().length > 0

                                    }

                                }

                                Rectangle {

                                    id:cmdrectangle

                                    height:flashcmdid.height-200

                                    // height: flashcmdid.height-rowid.x-rowid.height

                                    width: flashcmdid.width*0.98

                                    color: "transparent"

                                    ScrollView {

                                        // Adjust the position dynamically, here 0.1 indicates 10% from the top

                                        anchors.fill:parent

                                        visible: true

                                        TextArea {

                                            id: commandOutput

                                            width: parent.width

                                            height: contentHeight

                                            readOnly: true

                                            wrapMode: TextEdit.WordWrap

                                            anchors.top: parent.top

                                            textFormat: TextEdit.PlainText

                                            background: Rectangle {

                                                color: "black"

                                                radius: 4

                                            }

                                            color: "white"

                                        }

                                    }

                                }

                            }

                            Connections {

                                target: launcher

                                onCommandOutputReady: {

                                    commandOutput.text = output;

                                }

                            }

                        }

                        Rectangle {

                            id: windowsPromt

                            visible: false

                            height: 650/1080 * parent.height

                            width: 750/1920*parent.width

                            color:"#373B3D"

                            Column {

                                spacing: 10

                                Rectangle{

                                    id:windowtxt

                                    width: 200

                                    height: 30

                                    color:"#373B3D"

                                    Text {

                                        id: windowster

                                        text: qsTr("Command Promt :")

                                        color: "#FFFFFF"

                                        font.pointSize: Screen.height * 0.014

                                    }

                                }

                                Row {

                                    id: rowid1

                                    spacing: 10

                                    TextField {

                                        id: promtcommandInput

                                        placeholderText: "Enter command..."

                                        font.family: "Helvetica"

                                        // width: Math.round(600*scalefactor)

                                        width:flashcmdid.width-windowlanchButton.width-22

                                    }

                                    Button {

                                        id:windowlanchButton

                                        Text {

                                            text: "Run"

                                            font.family: "Helvetica"

                                            font.pointSize: Screen.height * 0.015

                                            font.bold: true

                                            color: enabled ? "#313235" : "#8059E8"

                                            anchors.centerIn: parent

                                        }

                                        Layout.preferredWidth: Math.round(80 * scalefactor)

                                        Layout.preferredHeight: Math.round(35 * scalefactor)

                                        height: Math.round(35 * scalefactor)

                                        width: Math.round(80 * scalefactor)

                                        background: Rectangle{

                                            radius: 2

                                            color: enabled?  "#8059E8" : "#373B3D"

                                            border.color: promtcommandInput.focus ? "#8059E8" : "#FFFFFF" // Change border color when TextField has focus                                border.width: 2

                                            border.width: 1

                                        }

                                        onClicked: {

                                            launcher.windowsPromt(promtcommandInput.text);

                                        }

                                        enabled: promtcommandInput.text.trim().length > 0

                                    }

                                }

                                Rectangle {

                                    id:cmdWinrectangle

                                    height:flashcmdid.height-200

                                    // height: flashcmdid.height-rowid.x-rowid.height

                                    width: flashcmdid.width*0.98

                                    color: "transparent"

                                    ScrollView {

                                        // Adjust the position dynamically, here 0.1 indicates 10% from the top

                                        anchors.fill:parent

                                        visible: true

                                        TextArea {

                                            id: commandOutput1

                                            width: parent.width

                                            height: contentHeight

                                            readOnly: true

                                            wrapMode: TextEdit.WordWrap

                                            anchors.top: parent.top

                                            textFormat: TextEdit.PlainText

                                            background: Rectangle {

                                                color: "black"

                                                radius:4

                                            }

                                            color: "white"

                                        }

                                    }

                                }

                            }

                            Connections {

                                target: launcher

                                onCommandOutputReady: {

                                    commandOutput1.text = output;

                                }

                            }

                        }
        }
    }
}
