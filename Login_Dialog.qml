import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Dialogs 1.2
import QtQuick.VirtualKeyboard 2.1
import QtQuick.VirtualKeyboard.Styles 2.1

Rectangle {
    id: root
    border.width: 2
    border.color: "black"
    signal cancel_clicked
    signal login_clicked(string username, string password)
    property int minimum_width: uname.width + 30
    property int minimum_height: 250
    Text{
        text: "Please Log In"
        anchors.horizontalCenter: root.horizontalCenter
        anchors.topMargin: 10
        font.pixelSize: 20
        font.bold: true
    }

    Column {
        anchors {
            centerIn: root
            left: root.left
            leftMargin: 15
            right: root.right
            rightMargin: 15
        }
        spacing: 16
        Column {
            spacing: 4
            Text { text: "Username" }
            TextField {
                id: uname
                focus: true
//                uname.forceActiveFocus()
                placeholderText: "Enter Username"
//                InputMethod {
//                }
                onActiveFocusChanged: uname.o
            }
        }
        Column {
            spacing: 4
            Text { text: "Password" }
            TextField {
                id: passwd
                echoMode: TextInput.Password
                placeholderText: "Enter Password"
//                Keys.onReturnPressed: root.login_clicked(uname.text, passwd.text)
            }
        }
        Row {
            spacing: 16
            anchors.horizontalCenter: parent.horizontalCenter
            Button {
                text: "Login"
                onClicked: root.login_clicked(uname.text, passwd.text)
            }
            Button {
                text: "Cancel"
                onClicked: root.cancel_clicked()
            }
        }
    }
//    InputPanel {
//            id: inputPanel
//            y: Qt.inputMethod.visible ? parent.height - inputPanel.height : parent.height
//            anchors.left: parent.left
//            anchors.right: parent.right
//            focus: true
//    }
}
