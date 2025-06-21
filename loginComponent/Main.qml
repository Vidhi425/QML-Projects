import QtQuick
import QtQuick.Controls.Material

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Popup{
        id: popup
        modal: true
        focus: true
        anchors.centerIn: parent
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

        Label{
            id:lblStatus
            anchors.centerIn: parent
            text:""
        }
    }

    Login{
        id:login
        anchors.fill: parent
        anchors.centerIn: paremt
        onLogin: {
            lblStatus.text = username + " Logged In"
            popup.open()
        }
    }
}
