import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Dialogs
import Obj 1.0
import QtQuick.Layouts


ApplicationWindow {
    id: windowid
    title: " UUU Tool"
    visible: true
    color:"#2B2D2E"
    property real scalefactor : {
        if(Screen.width > 1920) return 1.2
        else if(Screen.height < 1080) return 0.8
        else return 1
    }
    property bool tabEnablePriority:true
    property int tabIndex: 3
    height:screen.height
    width: screen.width

    flags: Qt.Window | Qt.FramelessWindowHint

    Rectangle {
        id: main_rect
        anchors.fill: parent
        color:"#2B2D2E"
        radius: 16
        Rectangle{
            id: logorect
            width: 800
            height: 400
            radius: 12
            color: "#373B3D"
            anchors.centerIn: parent
            ColumnLayout{
                id:logos
                anchors.fill: parent
                spacing: 5
                Rectangle{
                    id: img
                    width: 800
                    height: 200
                    color: "#373B3D"
                    radius: 12

                    Image {
                        id: main_airaa_logo_img
                        source: "qrc:/UUU_Tool/Image/AcL2.png"
                        x: (main_rect.width / 2) - width / 2
                        height: 140
                        width: 400
                        anchors{

                            top: parent.top
                            topMargin: 65
                            right: parent.right
                            rightMargin: 210
                        }
                    }
                }

                Rectangle{
                    id:txt
                    width: 800
                    height: 180
                    color:"#373B3D"
                    radius: 12
                    Text {
                        id: main_flashtool_txt
                        text: qsTr("PRIME MFG TOOL")
                        anchors.centerIn: parent
                        font{
                            bold: true
                            family: "C059"
                            pointSize: Screen.height * 0.04 * scalefactor//50
                        }
                        color:"#878C92"//"#BABDC0"
                    }
                }
            }

            MouseArea {
                anchors.fill:parent
                onClicked: {
                    mainwindid.visible = true
                    main_rect.visible = false
                }
            }
        }
    }
    Rectangle {
        id: popupRect1
        height: Math.round(200*scalefactor)
        width: Math.round(300*scalefactor)
        visible: false
        anchors.centerIn: parent

        Objref {
            id: ref
        }

        function handleStatus(changePopup, notifyConnect, rectColor) {
            myPopup.visible = changePopup === "true";
            popuptxt.text = notifyConnect;
            popuprect.color = rectColor;
        }

        Component.onCompleted: {
            ref.status.connect(handleStatus);
        }
        Popup {
            id: myPopup
            visible: false
            height: Math.round(60*scalefactor)
            width: Math.round(160*scalefactor)
            Rectangle {
                id: popuprect
                visible: true
                height: Math.round(61*scalefactor)
                width: Math.round(161*scalefactor)
                anchors.centerIn: parent

                Text {
                    id: popuptxt
                    text: ""
                    color: "black"
                    anchors.centerIn: parent
                }
            }
            modal: true
            closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside
        }
    }
    Item {
        id: mainwindid
        anchors.fill: parent
        visible: false
        Rectangle {
            id: titlebarid
            width: parent.width
            height: Screen.height * 0.08 * scalefactor
            color: "#373B3D"
            Image {
                id: logoid
                source: "qrc:/UUU_Tool/Image/flash1.png"
                width: Screen.width * 0.012
                height: Screen.height * 0.02
                anchors.left: parent.left
                anchors.leftMargin: Screen.width * 0.008
                anchors.top: parent.top
                anchors.topMargin: 10
            }
            Label {
                id: titleid
                text: "ACL MFG TOOL"
                font.family: "C059"
                color: "#F9F9FA"
                font.pointSize: Screen.height * 0.01
                anchors.left: logoid.right
                anchors.leftMargin: Screen.width * 0.005
                anchors.top: parent.top
                anchors.topMargin: 10
            }
            Row {
                spacing: Screen.width * 0.01 * scalefactor
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.topMargin: 7

                Button {
                    id: miniid
                    height: Math.round(30*scalefactor)
                    width: Math.round(25*scalefactor)
                    background: Rectangle {
                        color: "#696969"
                        radius: 5
                    }
                    Image {
                        source: "qrc:/UUU_Tool/Image/minimize.png"
                        height: Math.round(30*scalefactor)
                        width: Math.round(20*scalefactor)
                        anchors.centerIn: miniid
                    }
                    onClicked: {
                        console.log("minimized")
                        console.log("-----heigth---",titlebarid.height)
                        console.log("--width",titlebarid.width)
                        windowid.visibility = Window.Minimized

                    }
                }
                Button {
                    id: maxid
                    height: Math.round(30*scalefactor)
                    width: Math.round(25*scalefactor)
                    background: Rectangle {
                        color: "#696969"
                        radius: 5
                    }
                    Image {
                        source: "qrc:/UUU_Tool/Image/maximize.png"
                        height: Math.round(28*scalefactor)
                        width: Math.round(25*scalefactor)
                        anchors.centerIn: maxid
                    }

                    onClicked: {
                        console.log("maximized")
                        console.log("-----heigth---",titlebarid.height,windowid.height)
                        console.log("--width",titlebarid.width,windowid.width)
                        if (windowid.visibility === Window.Maximized)
                            windowid.visibility = Window.Windowed
                        else
                            windowid.visibility = Window.Maximized
                    }

                }
                Button {
                    id: closeid
                    height: Math.round(30*scalefactor)
                    width: Math.round(25*scalefactor)
                    background: Rectangle {
                        color: "#696969"
                        radius: 5
                    }
                    Image {
                        source: "qrc:/UUU_Tool/Image/closeIcon.png"
                        height: Math.round(25*scalefactor)
                        width: Math.round(25*scalefactor)
                        anchors.centerIn: closeid
                    }
                    onClicked: {
                        confirmationDialogid.open()
                    }

                    Dialog {
                        id: confirmationDialogid
                        x: (parent.width - width) / 2
                        y: (parent.height - height) / 2
                        parent: Overlay.overlay
                        height: Math.round(170*scalefactor)
                        width: Math.round(400*scalefactor)
                        modal: true
                        title: "Closing Application"
                        font.pointSize: Screen.height * 0.010
                        font.family: "C059"
                        standardButtons: Dialog.No | Dialog.Yes
                        onAccepted: {
                            Qt.quit()
                        }

                        onRejected: {
                            confirmationDialogid.close()
                        }
                        Row {
                            spacing: 10
                            Image {
                                id: questmark1id
                                source: "qrc:/UUU_Tool/Image/QuestionMark.png"
                                height: Math.round(30*scalefactor)
                                width: Math.round(30*scalefactor)
                            }

                            Label {
                                text: "Do you want to Exit..?"
                                font.pointSize: Screen.height * 0.012
                                font.family: "C059"
                            }
                        }
                    }
                }
            }
        }
        Rectangle {
            id: homepageid
            y: Screen.height * 0.04 * scalefactor// 40
            color: "#2B2D2E"
            width: parent.width
            height: parent.height - titlebarid.height

            TabBar {
                id: tabBarid
                width: titlebarid.width
                anchors.left: parent.left
                background: Rectangle {
                    id: rectid1
                    color: "#2B2D2E"
                    width: parent.width
                }

                property real fontSizeMultiplier: parent.height * 0.017

                focus: true

                Keys.onTabPressed: {
                    tabBarid.currentIndex = (tabBarid.currentIndex + 1) % tabBarid.count
                }

                Keys.onPressed: {
                    if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                        loadPage(tabBarid.currentIndex)
                        event.accepted = true
                    }
                }
                // Handle Shift+Tab (Backtab) key press for navigation

                Keys.onBacktabPressed: {
                    tabBarid.currentIndex = (tabBarid.currentIndex - 1 + tabBarid.count) % tabBarid.count
                }

                Repeater {
                    model: ["Communication", "Flash Command", "Help"]
                    TabButton {
                        id: tb2
                        text: modelData
                        width: titlebarid.width / 3
                        height: Math.round(40 * scalefactor)
                        property bool isHovered: false


                        background: Rectangle {
                            id: rectid2
                            color: tabBarid.currentIndex === index || tabBarid.isHovered ? "#8059E8":"#777f8c"
                            width: parent.width
                            border.color: "#878C92" //"#F4F5F8"
                            border.width: 1.5
                            radius: tabBarid.currentIndex === index? 8 : 4
                            //radius: 12
                        }
                        contentItem: Item {
                            implicitHeight: tb2.height -12
                            implicitWidth: tb2.width
                            Text {
                                text: tb2.text
                                color: tabBarid.currentIndex === index || tb2.isHovered ? "#000000" :"#FFFFFF"
                                font.family: "C059"
                                font.bold: true
                                font.pointSize: 12
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignVCenter
                                elide: Text.ElideMiddle
                                anchors.centerIn: parent
                            }
                        }
                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true
                            onEntered: {
                                tb2.isHovered = true;
                            }
                            onExited: {
                                tb2.isHovered = false;
                            }
                            onClicked: {
                                tabBarid.currentIndex = index;
                                loadPage(index);
                                // Ensure other tabs' isHovered is set to false
                                for (var i = 0; i < tabBarid.count; i++) {
                                    if (i !== index) {
                                        tabBarid.itemAt(i).isHovered = false;
                                    }
                                }
                            }
                        }
                    }
                }
            }


        }

        Rectangle {
            id: popupRect9
            width: 270
            height: 150 // Adjust height to fit all content
            x:1400
            y:100
            color:"#595959"
            visible: false
            radius: 8
            Column {
                spacing: 20
                anchors.centerIn: parent


                Button {
                    // height: 35
                    height: Math.round(50*scalefactor)
                    width: 250
                    // text: "Product Info"
                    Text {
                        text: "Product Info"
                        font.family: "Helvetica"
                        font.pointSize: Screen.height * 0.015
                        font.bold: true
                        // color: enabled ? "#313235" : "#8059E8"
                        color: "white"
                        anchors.centerIn: parent
                    }
                    background: Rectangle{
                        radius: 12
                        color: enabled?  "#8059E8" : "#373B3D"
                        border.color:  "#8059E8"
                        border.width: 2
                    }
                    onClicked: {
                        mstackid.push(productinfoPage)
                        windowid.tabEnablePriority = false

                    }
                }

                Button {
                    // height: 35
                    height: Math.round(50*scalefactor)
                    width: 250
                    // text: "About"
                    Text {
                        text: "About"
                        font.family: "Helvetica"
                        font.pointSize: Screen.height * 0.015
                        font.bold: true
                        // color: enabled ? "#313235" : "#8059E8"
                        color: "white"
                        anchors.centerIn: parent
                    }
                    background: Rectangle{
                        radius: 12
                        color: enabled?  "#8059E8" : "#373B3D"
                        border.color:  "#8059E8"
                        border.width: 2
                    }
                    onClicked: {
                        mstackid.push(aboutPage)
                        windowid.tabEnablePriority = false
                    }
                }
            }
        }
    }
    function loadPage(index) {
        switch (index) {
        case 0:
            console.log("****index****",index)
            if(windowid.tabEnablePriority){
                mstackid.push(communicationPage);
                popupRect9.visible = false
                windowid.tabEnablePriority=false
            }
            break;
        case 1:
            if(windowid.tabEnablePriority){
                mstackid.push(flashcommandPage);
                popupRect9.visible = false
                windowid.tabEnablePriority=false
            }
            break;
        case 2:
            if(windowid.tabEnablePriority){
                popupRect9.visible=true
            }
            break;
        default:
            console.error("Invalid index:", index);
        }
    }

    Component {
        id: communicationPage

        Communication {
            onCommunicationChannelClosed: {
                windowid.tabEnablePriority = true

            }
        }
    }
    Component {
        id: flashcommandPage
        Flashcmd {
            onFlashCommandClosed: {
                windowid.tabEnablePriority = true
            }
        }
    }
    Component {
        id: productinfoPage
        Productinfo {
            onProductInfoClosed: {
                windowid.tabEnablePriority = true
            }
        }
    }
    Component {
        id: aboutPage
        About {
            onAboutClosed: {
                windowid.tabEnablePriority = true
            }
        }
    }
    StackView {
        id: mstackid
        height: 800/1080 * windowid.height
        width: 800/1920 *windowid.width
        // anchors {
        //     left: parent.left
        //     top: parent.top
        //     leftMargin: Math.round(500 * scalefactor)
        //     topMargin: Math.round(150 * scalefactor)
        // }
        x: (parent.width - width) / 2
        y: (parent.height - height) / 2
        pushEnter: Transition {
            NumberAnimation {
                properties: "opacity"
                easing.type: Easing.Linear
                duration: 100
            }
        }
        pushExit: Transition {
            NumberAnimation {
                properties: "opacity"
                easing.type: Easing.Linear
                duration: 100
            }
        }
        popEnter: Transition {
            NumberAnimation {
                properties: "opacity"
                easing.type: Easing.Linear
                duration: 100
            }
        }
        popExit: Transition {
            NumberAnimation {
                properties: "opacity"
                easing.type: Easing.Linear
                duration: 100
            }
        }
    }
}
