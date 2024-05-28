import QtQuick
import QtQuick.Controls
Item{
    id:root
    property color controlColor: "#373B3D"
    property color controlBorderColor: "#525457"
    property color controlTextColor: "#F9F9FA"
    property color controlPopupTextColor: "blue"
    property alias modelList: control.model
    property alias currentIndex: control.currentIndex
    property alias comboxColor: comBng.color
    property string textFontFamily: ""
    property string comboTxtFont: ""
    property int textFontPixel: 0
    property int comboTextFontPixel: 0
    property alias comboBoxHeight: control.height
    property alias comboBoxWidth: control.width

    ComboBox{
        id:control

        model: ["First","Second","Third"]
        currentIndex: 0

        font {

            pixelSize: root.comboTextFontPixel
            family:root.textFontFamily
        }
        rightPadding: 13
        delegate: ItemDelegate{
            id:delegateDropDown

            required property var modelData
            required property int index

            width: control.width
            height: control.height
            contentItem: Text {
                id:contentText
                leftPadding: 8
                text: modelData
                color: root.controlTextColor
                font.family: root.textFontFamily
                font.pixelSize: root.textFontPixel
                elide: Text.ElideRight
                verticalAlignment: Text.AlignVCenter
            }
            background: Rectangle{
                color: highlighted ?"#A9A0C5":root.controlColor
                border.color:root.controlBorderColor
                opacity: 0.92
                radius: 4
            }
            highlighted: control.highlightedIndex === index
        }
        contentItem: Text {
            leftPadding: 8
            rightPadding: control.indicator.width + control.spacing
            text: control.displayText
            font: control.font

            color:root.controlPopupTextColor
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }
        background: Rectangle{
            id:comBng
            implicitHeight: 40
            implicitWidth: 120
            color: "#8059E8"
            border.color: root.controlBorderColor
            border.width: control.visualFocus ? 2 : 1
            radius: 4
        }
        popup:  Popup{
            y:control.height -1
            width: control.width
            implicitHeight: contentItem.implicitHeight
            padding: 1

            contentItem: ListView{
                clip: true
                implicitHeight: contentHeight
                model: control.popup.visible ? control.delegateModel : null
                currentIndex: control.highlightedIndex
            }
            background: Rectangle{
                border.color: root.controlBorderColor
                color:"transparent"
                radius: 1
            }
        }
    }
}
