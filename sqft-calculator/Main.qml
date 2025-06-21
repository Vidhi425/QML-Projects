import QtQuick
import QtQuick.Layouts 2.15
import QtQuick.Controls.Material

Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")


    function calc(){
        var num = spinBox.value * spinBox1.value
        label.text = num + " sqFt"
    }

    ColumnLayout {
        id: columnLayout
        width: 252
        height: 285
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        Label {
            id: label
            color: "#000000"
            text: qsTr("SqFT ")
            font.pointSize: 30
            Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
        }

        Grid {
            id: grid
            anchors.top: label.bottom
            anchors.bottom: label.top
            spacing: 10
            columns: 2

            Label {
                id: label1
                text: qsTr("Height")
            }

            SpinBox {
                id: spinBox

            }

            Label {
                id: label2
                text: qsTr("Width")
            }

            SpinBox {
                id: spinBox1
            }
        }

        Connections{
            target: spinBox
            onValueModified:calc()
        }

        Connections{
            target: spinBox1
            onValueModified:calc()
        }

    }
}
