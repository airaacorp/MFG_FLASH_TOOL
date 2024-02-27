import QtQuick 2.15
import QtQuick.Dialogs
import QtQuick.Controls 2.15

Item {
    id: windid
    height: 800
    width: height

    anchors.centerIn: parent

    property int i: 0
    property int j: 0

    function getSelectedFilePath(url) {
        if (url) {
            return url.toString();
        } else {
            return "";
        }
    }

    Rectangle {
        id:homePage
        anchors.fill: parent
        border.color: "#616efd" // 616efd
        border.width: 1
        color: "#d5d5d5"

        Rectangle {
            width: 800
            height: 25
            color: "#777f8c" //"#777F8C"

            Row {
                spacing: 682

                Text {
                    id: txtid
                    text: qsTr(" Choose File")
                    x: 5
                    y: 1
                    font.pointSize: 13
                    color: "white"
                }

                Button {
                id: closeid
                width: 25

                height: 25
                x: 574
                    Image {
                        id: close
                        source: "qrc:/Image/Close_red.png"
                        width: 25
                        height: 25
                    }

                    onClicked: {
                        windid.visible = false
                    }
                }
            }
        }

        Column {
            spacing: 15
            y: 30
            x: 10

            Row {
                spacing: 12

                Row {
                    id: rowid1
                    spacing: 10

                    Text {
                        id: file1id
                        text: "Select File 1: "
                        font.pointSize: 13
                    }

                    Frame {
                        id: rect1id
                        width: 550
                        height: 33

                        Label {
                            id: selectedFilePathLabel1
                            text: ""
                            y: -6
                            font.pointSize: 13
                        }

                        Button {
                            id: btn1
                            width: 30
                            height: 27
                            x: 505
                            y: -9

                            ToolTip.delay: 1000
                            ToolTip.visible: hovered
                            ToolTip.text: "Add file that is to be flashed"

                            Image {
                                id: dwn1arid
                                source: "qrc:/Image/Downarrow.png"
                                width: 27
                                height: 25
                                anchors.centerIn: btn1                                
                            }

                            onClicked: fileDialog1.open()

                            FileDialog {
                                id: fileDialog1
                                title: "Choose File"
                                onAccepted: {
                                    var file1 = fileDialog1.fileUrls;
                                    selectedFilePathLabel1.visible = true
                                    selectedFilePathLabel1.text = selectedFile
                                    console.log("You chose: ", selectedFile)
                                }
                                onRejected: {
                                    console.log("File selection canceled")
                                }
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
                        id: clearid
                        source: "qrc:/Image/clear.png"
                        width: 27
                        height: 27
                        anchors.centerIn: clear
                    }

                    onClicked: {
                        selectedFilePathLabel1.visible = false
                    }
                }

                Button {
                    text: "Add"
                    width: 65
                    height: 35
                    font.pointSize: 13

                    ToolTip.delay: 1000
                    ToolTip.visible: hovered
                    ToolTip.text: "Adds more files"


                    onClicked: {
                        i++
                        if(i === 1) {
                            rowid7.visible = true
                        } else if (i === 2) {
                            rowid8.visible = true
                        } else if (i === 3) {
                            rowid9.visible = true
                        } else if (i === 4) {
                            rowid10.visible = true
                            i = 0;
                        }
                    }
                }
            }

            Row {
                spacing: 12

                Row {
                    spacing: 12

                    Text {
                        id: file2id
                        text: "Select File 2: "
                        font.pointSize: 13
                    }

                    Frame {
                        id: rect2id
                        width: 550
                        height: 33

                        Label {
                            id: selectedFilePathLabel2
                            text: ""
                            y: -6
                            font.pointSize: 13
                        }

                        Button {
                            id: btn2
                            width: 30
                            height: 27
                            x: 505
                            y: -9

                            ToolTip.delay: 1000
                            ToolTip.visible: hovered
                            ToolTip.text: "Add file that is to be flashed"

                            Image {
                                id: dwn2arid
                                source: "qrc:/Image/Downarrow.png"
                                width: 27
                                height: 25
                                anchors.centerIn: btn2
                            }

                            onClicked: fileDialog2.open()

                            FileDialog {
                                id: fileDialog2
                                title: "Choose File"
                                onAccepted: {
                                    var file1 = fileDialog2.fileUrls;
                                    selectedFilePathLabel2.visible = true
                                    selectedFilePathLabel2.text = selectedFile
                                    console.log("You chose: ", selectedFile)
                                }

                                onRejected: {
                                    console.log("File selection canceled");
                                }
                            }
                        }
                    }
                }

                Button {
                        id: clear2
                        width: 30
                        height: 30

                        ToolTip.delay: 1000
                        ToolTip.visible: hovered
                        ToolTip.text: "Clears the attached file"

                        Image {
                            id: clear2id
                            source: "qrc:/Image/clear.png"
                            width: 27
                            height: 27
                            anchors.centerIn: clear2
                        }

                        onClicked: {
                            selectedFilePathLabel2.visible = false
                        }
                    }

                Button {
                    text: "Clear"
                    width: 65
                    height: 35
                    font.pointSize: 13

                    ToolTip.delay: 1000
                    ToolTip.visible: hovered
                    ToolTip.text: "Clears the files that are not used"

                    onClicked: {
                        j++
                        if(j === 4) {
                            rowid7.visible = false
                            selectedFilePathLabel7.visible = false
                            j = 0;
                        } else if (j === 3) {
                            rowid8.visible = false
                            selectedFilePathLabel8.visible = false
                        } else if (j === 2) {
                            rowid9.visible = false
                            selectedFilePathLabel9.visible = false
                        } else if (j === 1) {
                            rowid10.visible = false
                            selectedFilePathLabel10.visible = false
                        }
                    }
                }
            }

            Row {
                spacing: 12

                Text {
                    id: file3id
                    text: "Select File 3: "
                    font.pointSize: 13
                }

                Frame {
                    id: rect3id
                    width: 550
                    height: 33

                    Label {
                        id: selectedFilePathLabel3
                        text: ""
                        y: -6
                        font.pointSize: 13
                    }

                    Button {
                        id: btn3
                        width: 30
                        height: 27
                        x: 505
                        y: -9

                        ToolTip.delay: 1000
                        ToolTip.visible: hovered
                        ToolTip.text: "Add file that is to be flashed"

                        Image {
                            id: dwn3arid
                            source: "qrc:/Image/Downarrow.png"
                            width: 27
                            height: 25
                            anchors.centerIn: btn3
                        }

                        onClicked: fileDialog3.open()

                        FileDialog {
                            id: fileDialog3
                            title: "Choose File"
                            onAccepted: {
                                var file1 = fileDialog3.fileUrls;
                                selectedFilePathLabel3.visible = true
                                selectedFilePathLabel3.text = selectedFile
                                console.log("You chose: ", selectedFile)
                            }
                            onRejected: {
                                console.log("File selection canceled");
                            }
                        }
                    }
                }

                Button {
                    id: clear3
                    width: 30
                    height: 30

                    ToolTip.delay: 1000
                    ToolTip.visible: hovered
                    ToolTip.text: "Clears the attached file"

                    Image {
                        id: clear3id
                        source: "qrc:/Image/clear.png"
                        width: 27
                        height: 27
                        anchors.centerIn: clear3
                    }

                    onClicked: {
                        selectedFilePathLabel3.visible = false
                    }
                }
            }

            Row {
                spacing: 12

                Text {
                    id: file4id
                    text: "Select File 4: "
                    font.pointSize: 13
                }

                Frame {
                    id: rect4id
                    width: 550
                    height: 33

                    Label {
                        id: selectedFilePathLabel4
                        text: ""
                        y: -6
                        font.pointSize: 13
                    }

                    Button {
                        id: btn4
                        width: 30
                        height: 27
                        x: 505
                        y: -9

                        ToolTip.delay: 1000
                        ToolTip.visible: hovered
                        ToolTip.text: "Add file that is to be flashed"

                        Image {
                            id: dwnarid
                            source: "qrc:/Image/Downarrow.png"
                            width: 27
                            height: 25
                            anchors.centerIn: btn4
                        }

                        onClicked: fileDialog4.open()

                        FileDialog {
                            id: fileDialog4
                            title: "Choose File"
                            onAccepted: {
                                var file1 = fileDialog4.fileUrls;
                                selectedFilePathLabel4.visible = true
                                selectedFilePathLabel4.text = selectedFile
                                console.log("You chose: ", selectedFile)
                            }
                            onRejected: {
                                console.log("File selection canceled");
                            }
                        }
                    }
                }

                Button {
                    id: clear4
                    width: 30
                    height: 30

                    ToolTip.delay: 1000
                    ToolTip.visible: hovered
                    ToolTip.text: "Clears the attached file"

                    Image {
                        id: clear4id
                        source: "qrc:/Image/clear.png"
                        width: 27
                        height: 27
                        anchors.centerIn: clear4
                    }

                    onClicked: {
                        selectedFilePathLabel4.visible = false
                    }
                }
            }

            Row {
                spacing: 12

                Text {
                    id: file5id
                    text: "Select File 5: "
                    font.pointSize: 13
                }

                Frame {
                    id: rect5id
                    width: 550
                    height: 33

                    Label {
                        id: selectedFilePathLabel5
                        text: ""
                        y: -6
                        font.pointSize: 13
                    }

                    Button {
                        id: btn5
                        width: 30
                        height: 27
                        x: 505
                        y: -9

                        ToolTip.delay: 1000
                        ToolTip.visible: hovered
                        ToolTip.text: "Add file that is to be flashed"

                        Image {
                            id: dwn5arid
                            source: "qrc:/Image/Downarrow.png"
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
                                selectedFilePathLabel5.visible = true
                                selectedFilePathLabel5.text = selectedFile
                                console.log("You chose: ", selectedFile)
                            }
                            onRejected: {
                                console.log("File selection canceled");
                            }
                        }
                    }
                }

                Button {
                    id: clear5
                    width: 30
                    height: 30

                    ToolTip.delay: 1000
                    ToolTip.visible: hovered
                    ToolTip.text: "Clears the attached file"

                    Image {
                        id: clear5id
                        source: "qrc:/Image/clear.png"
                        width: 27
                        height: 27
                        anchors.centerIn: clear5
                    }

                    onClicked: {
                        selectedFilePathLabel5.visible = false
                    }
                }
            }

            Row {
                spacing: 12

                Text {
                    id: file6id
                    text: "Select File 6: "
                    font.pointSize: 13
                }

                Frame {
                    id: rect6id
                    width: 550
                    height: 33

                    Label {
                        id: selectedFilePathLabel6
                        text: ""
                        y: -6
                        font.pointSize: 13
                    }

                    Button {
                        id: btn6
                        width: 30
                        height: 27
                        x: 505
                        y: -9

                        ToolTip.delay: 1000
                        ToolTip.visible: hovered
                        ToolTip.text: "Add file that is to be flashed"

                        Image {
                            id: dwn6arid
                            source: "qrc:/Image/Downarrow.png"
                            width: 27
                            height: 25
                            anchors.centerIn: btn6
                        }

                        onClicked: fileDialog6.open()

                        FileDialog {
                            id: fileDialog6
                            title: "Choose File"
                            onAccepted: {
                                var file1 = fileDialog6.fileUrls;
                                selectedFilePathLabel6.visible = true
                                selectedFilePathLabel6.text = selectedFile
                                console.log("You chose: ", selectedFile)
                            }
                            onRejected: {
                                console.log("File selection canceled");
                            }
                        }
                    }
                }
                Button {
                    id: clear6
                    width: 30
                    height: 30

                    ToolTip.delay: 1000
                    ToolTip.visible: hovered
                    ToolTip.text: "Clears the attached file"

                    Image {
                        id: clear6id
                        source: "qrc:/Image/clear.png"
                        width: 27
                        height: 27
                        anchors.centerIn: clear6
                    }

                    onClicked: {
                        selectedFilePathLabel6.visible = false
                    }
                }
            }

            Row {
                id: rowid7
                visible: false
                spacing: 12

                Text {
                    id: file7id
                    text: "Select File 7: "
                    font.pointSize: 13
                }

                Frame {
                    id: rect7id
                    width: 550
                    height: 33

                    Label {
                        id: selectedFilePathLabel7
                        text: ""
                        y: -6
                        font.pointSize: 13
                    }

                    Button {
                        id: btn7
                        width: 30
                        height: 27
                        x: 505
                        y: -9

                        ToolTip.delay: 1000
                        ToolTip.visible: hovered
                        ToolTip.text: "Add file that is to be flashed"

                        Image {
                            id: dwn7arid
                            source: "qrc:/Image/Downarrow.png"
                            width: 27
                            height: 25
                            anchors.centerIn: btn7
                        }

                        onClicked: fileDialog7.open()

                        FileDialog {
                            id: fileDialog7
                            title: "Choose File"
                            onAccepted: {
                                var file1 = fileDialog7.fileUrls;
                                selectedFilePathLabel7.visible = true
                                selectedFilePathLabel7.text = selectedFile
                                console.log("You chose: ", selectedFile)
                            }

                            onRejected: {
                                console.log("File selection canceled");
                            }
                        }
                    }
                }
                Button {
                    id: clear7
                    width: 30
                    height: 30

                    ToolTip.delay: 1000
                    ToolTip.visible: hovered
                    ToolTip.text: "Clears the attached file"

                    Image {
                        id: clear7id
                        source: "qrc:/Image/clear.png"
                        width: 27
                        height: 27
                        anchors.centerIn: clear7
                    }

                    onClicked: {
                        selectedFilePathLabel7.visible = false
                    }
                }
            }

            Row {
                id: rowid8
                visible: false
                spacing: 12

                Text {
                    id: file8id
                    text: "Select File 8: "
                    font.pointSize: 13
                }

                Frame {
                    id: rect8id
                    width: 550
                    height: 33

                    Label {
                        id: selectedFilePathLabel8
                        text: ""
                        y: -6
                        font.pointSize: 13
                    }

                    Button {
                        id: btn8
                        width: 30
                        height: 27
                        x: 505
                        y: -9

                        ToolTip.delay: 1000
                        ToolTip.visible: hovered
                        ToolTip.text: "Add file that is to be flashed"

                        Image {
                            id: dwn8arid
                            source: "qrc:/Image/Downarrow.png"
                            width: 27
                            height: 25
                            anchors.centerIn: btn8
                        }

                        onClicked: fileDialog8.open()

                        FileDialog {
                            id: fileDialog8
                            title: "Choose File"
                            onAccepted: {
                                var file1 = fileDialog8.fileUrls;
                                selectedFilePathLabel8.visible = true
                                selectedFilePathLabel8.text = selectedFile
                                console.log("You chose: ", selectedFile)
                            }

                            onRejected: {
                                console.log("File selection canceled");
                            }
                        }
                    }
                }
                Button {
                    id: clear8
                    width: 30
                    height: 30

                    ToolTip.delay: 1000
                    ToolTip.visible: hovered
                    ToolTip.text: "Clears the attached file"

                    Image {
                        id: clear8id
                        source: "qrc:/Image/clear.png"
                        width: 27
                        height: 27
                        anchors.centerIn: clear8
                    }

                    onClicked: {
                        selectedFilePathLabel8.visible = false
                    }
                }
            }

            Row {
                id: rowid9
                visible: false
                spacing: 12

                Text {
                    id: file9id
                    text: "Select File 9: "
                    font.pointSize: 13
                }

                Frame {
                    id: rect9id
                    width: 550
                    height: 33

                    Label {
                        id: selectedFilePathLabel9
                        text: ""
                        y: -6
                        font.pointSize: 13
                    }

                    Button {
                        id: btn9
                        width: 30
                        height: 27
                        x: 505
                        y: -9

                        ToolTip.delay: 1000
                        ToolTip.visible: hovered
                        ToolTip.text: "Add file that is to be flashed"

                        Image {
                            id: dwn9arid
                            source: "qrc:/Image/Downarrow.png"
                            width: 27
                            height: 25
                            anchors.centerIn: btn9
                        }

                        onClicked: fileDialog9.open()

                        FileDialog {
                            id: fileDialog9
                            title: "Choose File"
                            onAccepted: {
                                var file1 = fileDialog9.fileUrls;
                                selectedFilePathLabel9.visible = true
                                selectedFilePathLabel9.text = selectedFile
                                console.log("You chose: ", selectedFile)
                            }

                            onRejected: {
                                console.log("File selection canceled");
                            }
                        }
                    }
                }
                Button {
                    id: clear9
                    width: 30
                    height: 30

                    ToolTip.delay: 1000
                    ToolTip.visible: hovered
                    ToolTip.text: "Clears the attached file"

                    Image {
                        id: clear9id
                        source: "qrc:/Image/clear.png"
                        width: 27
                        height: 27
                        anchors.centerIn: clear9
                    }

                    onClicked: {
                        selectedFilePathLabel9.visible = false
                    }
                }
            }

            Row {
                id: rowid10
                visible: false
                spacing: 12

                Text {
                    id: file10id
                    text: "Select File 10: "
                    font.pointSize: 13
                }

                Frame {
                    id: rect10id
                    width: 550
                    height: 33

                    Label {
                        id: selectedFilePathLabel10
                        text: ""
                        y: -6
                        font.pointSize: 13
                    }

                    Button {
                        id: btn10
                        width: 30
                        height: 27
                        x: 505
                        y: -9

                        ToolTip.delay: 1000
                        ToolTip.visible: hovered
                        ToolTip.text: "Add file that is to be flashed"

                        Image {
                            id: dwn10arid
                            source: "qrc:/Image/Downarrow.png"
                            width: 27
                            height: 25
                            anchors.centerIn: btn10
                        }

                        onClicked: fileDialog10.open()

                        FileDialog {
                            id: fileDialog10
                            title: "Choose File"
                            onAccepted: {
                                var file1 = fileDialog10.fileUrls;
                                selectedFilePathLabel10.visible = true
                                selectedFilePathLabel10.text = selectedFile
                                console.log("You chose: ", selectedFile)
                            }

                            onRejected: {
                                console.log("File selection canceled");
                            }
                        }
                    }
                }
                Button {
                    id: clear10
                    width: 30
                    height: 30

                    ToolTip.delay: 1000
                    ToolTip.visible: hovered
                    ToolTip.text: "Clears the attached file"

                    Image {
                        id: clear10id
                        source: "qrc:/Image/clear.png"
                        width: 27
                        height: 27
                        anchors.centerIn: clear10
                    }

                    onClicked: {
                        selectedFilePathLabel10.visible = false
                    }
                }
            }
        }

        Row {
            spacing: 10
            x: 610
            y: 750

            Button {
                text: "Attach"
                font.pointSize: 13
                width: 80
                height: 35

                ToolTip.delay: 1000
                ToolTip.visible: hovered
                ToolTip.text: "Attach files that is to be flashed"
            }

            Button {
                property int i: 1
                text: "Cancel"
                font.pointSize: 13
                width: 90
                height: 35

                ToolTip.delay: 1000
                ToolTip.visible: hovered
                ToolTip.text: "Clears all the files that is attached"

                onClicked: {
                    selectedFilePathLabel1.visible = false
                    selectedFilePathLabel2.visible = false
                    selectedFilePathLabel3.visible = false
                    selectedFilePathLabel4.visible = false
                    selectedFilePathLabel5.visible = false
                    selectedFilePathLabel6.visible = false
                    selectedFilePathLabel7.visible = false
                    selectedFilePathLabel8.visible = false
                    selectedFilePathLabel9.visible = false
                    selectedFilePathLabel10.visible = false
                }
            }
        }
    }
}
