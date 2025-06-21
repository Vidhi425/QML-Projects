import QtQuick
import QtQuick.Controls        // Add this import!
import QtQuick.Controls.Material

Component {
    id: diceDelegate

    Item {
        id: item
        width: parent.width
        height: 60  // Reduced height for better fit

        Row {
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.verticalCenter: parent.verticalCenter
            spacing: 15

            Label {
                width: 50
                font.bold: true
                font.pixelSize: 25
                text: name
                anchors.verticalCenter: parent.verticalCenter
            }

            SpinBox {
                id: spinBox
                from: 0
                to: 100
                value: model.value
                anchors.verticalCenter: parent.verticalCenter
                onValueChanged: {
                    model.value = spinBox.value
                }
            }
        }
    }
}
