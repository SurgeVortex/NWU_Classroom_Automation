import QtQuick 2.9
import QtQuick.Controls 2.2
import "./"

Item {
    id: root
    function open() { menu.open() }
    Menu {
        id: menu
        MenuItem {
            text: "Logout"
            onClicked: { App_Settings.logged_in = 0 }
        }
        MenuItem {
            text: "Remote Connection"
        }
    }
}
