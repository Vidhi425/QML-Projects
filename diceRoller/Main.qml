import QtQuick
import QtQuick.Controls.Material

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    function calc(){
        var model = listView.model
        var total = 0

        for(var i =0 ;i < model.count; i++){
            var item = model.get(i)

            if(item.value > 0){

                for(var roll = 0; roll < item.value; roll++){
                    var min = 1
                    var max = item.number

                    var subtotal = Math.floor(Math.random() * (max - min + 1) + min)
                    total = total + subtotal
                }
            }

        }
        label.text = "Total: " + total
    }

    Column {
        id: column
        anchors.fill: parent
        spacing: 10

        ListView {
            id: listView
            width: parent.width
            height: parent.height - 60
            focus: true
            // Remove conflicting anchors when using Column layout
            anchors.margins: 10  // Use this instead of individual anchor margins

            model: DiceModel {
                id: diceModel  // Correct ID for model
            }
            delegate: DiceDelegate {
                id: diceDelegate  // Correct ID for delegate
            }
        }

        Row {
            id: row
            width: parent.width
            height: 50

            Rectangle {
                height: parent.height
                width: parent.width
                color: "gray"

                Label {
                    id: label
                    color: "white"
                    text: "Total: 0"
                    font.bold: true
                    font.pointSize: 25
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                }

                Button {
                    id: btn
                    text: "Calculate"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 10
                    onClicked: calc()
                }
            }
        }
    }
}
