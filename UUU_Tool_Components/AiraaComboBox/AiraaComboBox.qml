import QtQuick
import QtQuick.Controls
ComboBox {

    visible: true
    spacing: 10
    width: Math.round(170*scalefactor)
    font.pointSize: Screen.height * 0.017

    font.family: "Helvetica"
    delegate: ItemDelegate{
        text: modelData
        // font.pixelSize: 20
        font.pointSize: Screen.height * 0.015
        width: parent.width
        font.family: "Helvetica"
    }
}
