import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Dialogs 1.2

Dialog {
    //    modal: true
    title: "Please enter login details"
    x: (window.width - width) / 2
    y: window.height / 6
    contentItem: Rectangle {
        Column {
            anchors.centerIn: parent
            spacing: 16
            Column {
                spacing: 4
                Text { text: "Username" }
                TextField { focus: true }
            }
            Column {
                spacing: 4
                Text { text: "Password" }
                TextField {
                    echoMode: TextInput.Password
                }
            }
            Row {
                spacing: 16
                anchors.horizontalCenter: parent.horizontalCenter
                Button {
                    text: "Login"
                    onClicked: {
                        drawer_button.enabled = true
                        drawer_icon.visible = true
                        drawer.width = window.width * 0.60
                        drawer.list_visible = true
                        parent.close()
                        settings.logged_in = true
                    }
                }
                Button { text: "Cancel"; onClicked: login_dialog.close() }
            }
        }
    }
}
