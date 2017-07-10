pragma Singleton
import QtQuick 2.9
import "."

QtObject {
    property bool logged_in: false
    onLogged_inChanged: console.info("App_Settings.logged_in: " + logged_in)

}
