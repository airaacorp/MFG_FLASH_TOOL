import QtQuick
import QtQuick.Controls
TextField {
    property real scalefactor : {
        if(Screen.width > 1920) return 1.2
        else if(Screen.height < 1080) return 0.8
        else return 1
    }
    height: Math.round(60*scalefactor)
    width: Math.round(260*scalefactor)
    placeholderText: "Enter Port Number"
    font.family: "Helvetica"
    font.pointSize: Screen.height * 0.014
    background: Rectangle {
        color: portNameTextField.focus ? "#d9d9d9" : "#F8F8FF"
        border.color: portNameTextField.invalidInput && !portNameTextField.focus ? "red" : "#CCCCCC"
        radius: 5
    }
}

