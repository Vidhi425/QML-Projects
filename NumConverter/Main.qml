import QtQuick
import QtQuick.Controls.Material

Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    function convert() {
        var value = parseFloat(textField.text)
        if (isNaN(value)) {
            label3.text = "Invalid input"
            return
        }

        var ret = 0
        switch (comboBox.currentIndex) {
        case 0:
            ret = inch_to_feet(value)
            break
        case 1:
            ret = feet_to_inch(value)
            break
        }
        label3.text = ret.toFixed(2)
    }

    function inch_to_feet(value) {
        return value / 12
    }

    function feet_to_inch(value) {
        return value * 12
    }

    Column {
        id: column
        width: 350
        height: 300
        anchors.centerIn: parent

        Grid {
            id: grid
            anchors.fill: parent
            spacing: 20
            columns: 2
            anchors.horizontalCenter: parent.horizontalCenter

            Label {
                text: qsTr("Type")
                font.pointSize: 15
            }

            ComboBox {
                id: comboBox
                model: ["inch_to_feet", "feet_to_inch"]
                width: parent.width * 0.6
            }

            Label {
                text: qsTr("From")
                font.pointSize: 15
            }

            TextField {
                id: textField
                placeholderTextColor: "#000000"
                width: parent.width * 0.6
            }

            Label {
                text: qsTr("Result:")
                font.pointSize: 15
            }

            Label {
                id: label3
                text: qsTr(" ")
                font.pointSize: 15
            }

            Button {
                text: qsTr("Convert")
                onClicked: convert()
            }
        }
    }
}
