pragma Singleton
import QtQuick 2.0
import Qt.labs.settings 1.0
import "."

Settings {
    property bool logged_in: false
    onLogged_inChanged: console.info("App_Settings.logged_in: " + logged_in)
}
