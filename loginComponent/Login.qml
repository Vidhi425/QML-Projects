import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: root
    width: 300
    height: 300

    signal login(string username, string password)

    Rectangle {
        width: parent.width
        height: parent.height
        color: "#f9f9f9"
        radius: 8
        border.color: "#ccc"

        Column {
            id: column
            spacing: 12
            anchors.centerIn: parent
            width: parent.width * 0.8

            Label {
                text: "Login"
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Label {
                text: "Username"
                font.pixelSize: 14
            }

            TextField {
                id: txtUsername
                placeholderText: "Enter your username"
                width: parent.width
            }

            Label {
                text: "Password"
                font.pixelSize: 14
            }

            TextField {
                id: txtPassword
                placeholderText: "Enter your password"
                echoMode: TextInput.Password
                width: parent.width
            }

            Button {
                text: "Submit"
                width: parent.width
                onClicked: {
                    root.login(txtUsername.text, txtPassword.text)
                }
            }
        }
    }
}
