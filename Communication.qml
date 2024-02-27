import QtQuick 2.15
import QtQuick.Controls 2.15
import com.example 1.0
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: "Serial Communication Demo"

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 10

        // SerialCommunication component
        SerialCommunication {
            id: serialComm
        }

        // Port Name TextField
        TextField {
            id: portNameTextField
            placeholderText: "Enter Port Number"
        }

        // Baud Rate TextField
        TextField {
            id: baudRateTextField
            placeholderText: "Enter Baud Rate"
        }

        // Connect Button
        Button {
            text: "Connect"
            onClicked: {
                serialComm.connectSerial(portNameTextField.text, parseInt(baudRateTextField.text)) // Calling backend function
            }
        }

        // Popup for entering data
        Popup {
            id: dataPopup
            width: 300
            height: 150
            modal: true
            focus: true

            Rectangle {
                width: parent.width
                height: parent.height
                color: "lightblue"


                TextField {
                    id: dynamicTextField
                    anchors.top: parent.top
                    width: parent.width
                    placeholderText: "Enter data to send"
                    color: "white"
                }


                Button {
                    text: "Send"
                    anchors {
                        top: dynamicTextField.bottom
                        horizontalCenter: dynamicTextField.horizontalCenter
                    }
                    onClicked: {
                        serialComm.sendData(dynamicTextField.text)  // Calling backend function
                        dataPopup.close()
                    }
                }
            }

            // Clear the dynamicTextField when the popup is closed
            onClosed: {
                dynamicTextField.text = ""
            }
        }

        // Send Data Button
        Button {
            text: "Send Data"
            onClicked: {
                dataPopup.open() //popup Calling
            }
        }

        // Receive Data Button
        Button {
            text: "Receive Data"
            onClicked: {
                var receivedData = serialComm.receiveData()  // Calling backend function
                console.log("Received Data:", receivedData)
            }
        }

        // Close Serial Button
        Button {
            text: "Close Serial"
            onClicked: {
                serialComm.closeSerial()
            }
        }
    }
}
