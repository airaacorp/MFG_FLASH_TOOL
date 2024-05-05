import QtQuick
import QtQuick.Controls

Button {
    id: control
    height: Math.round(60*scalefactor)
    width: Math.round(200*scalefactor)
    contentItem: Text {
        text: control.text
        font.family: "Helvetica"
        font.pointSize: Screen.height * 0.015
        font.bold: true
        color: "white"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter

    }
    background: Rectangle{
        radius: 60
        color: "#777f8c"
    }
}
