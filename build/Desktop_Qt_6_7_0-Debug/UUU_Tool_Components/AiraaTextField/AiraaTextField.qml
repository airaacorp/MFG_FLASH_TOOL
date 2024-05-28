
import QtQuick

import QtQuick.Controls

Item {

    property alias textBoxWidth: containerRectId.width

    property alias textBoxHeight: containerRectId.height

    property alias textBoxColor: bGRId.color

    property alias textBoxRadius: containerRectId.radius

    property string textBoxBorderColor: "blue"

    property string textBoxBorderColorOnFocus: "yellow"

    property alias textBoxBorderWidth: bGRId.border.width

    property alias textBoxTextWidth: textBoxTextId.width

    property alias textBoxPlaceholderText: textBoxTextId.placeholderText

    property alias textBoxTextLeftPadding: textBoxTextId.leftPadding

    property alias textBoxTextTopPadding: textBoxTextId.topPadding

    property alias textBoxTextColor: textBoxTextId.color

    property alias textBoxFont: textBoxTextId.font.family

    property alias textBoxFontSize: textBoxTextId.font.pixelSize

    property alias textBoxString: textBoxTextId.text


    signal editFinished


    Rectangle{

        id:containerRectId

        height:48

        width:280

        TextField{

            id:textBoxTextId

            height: parent.height

            width:parent.width

            placeholderText: ""

            placeholderTextColor: textBoxTextColor

            color: "red"

            background: Rectangle{

                id:bGRId

                color:"blue"

                border.width:1

                border.color:(textBoxTextId.focus)?textBoxBorderColorOnFocus:textBoxBorderColor

                radius: 4

            }

            onEditingFinished: {

                editFinished()

            }

        }

    }

}

