import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Window 2.3
import "."

ApplicationWindow {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Classroom Automation")

    Loader { id: loader }
//    App_Settings.onLogged_inChanged: {
//        console.log ("test")
//        if (App_Settings.logged_in === true)
//            loader.source = "Side_Panel.qml"
//    }



    header: ToolBar {
        id: app_header
            RowLayout {
                anchors.fill: parent
                ToolButton {
                    id: drawer_button
                    contentItem: Image {
                        id: drawer_icon
                        fillMode: Image.Pad
                        horizontalAlignment: Image.AlignHCenter
                        verticalAlignment: Image.AlignVCenter
                        source: "Icons/Drawer_Icon.png"
                    }
                    onClicked: drawer.position ? drawer.close() : drawer.open()
                    states: [
                        State {
                        name: "hidden"; when: !App_Settings.logged_in
                        PropertyChanges { target: drawer_icon; visible: false }
                        PropertyChanges { target:drawer_button; enabled: false }
                    }
                    ]
                }
                Label {
                    text: qsTr("Classroom Controls")
                    elide: Label.ElideRight
                    horizontalAlignment: Qt.AlignHCenter
                    verticalAlignment: Qt.AlignVCenter
                    Layout.fillWidth: true
                    font.bold: true
                    font.pixelSize: 15
                }
                ToolButton {
                    contentItem: Image {
                        fillMode: Image.Pad
//                        anchors.fill: app_header
                        horizontalAlignment: Image.AlignHCenter
                        verticalAlignment: Image.AlignVCenter
                        source: "Icons/Menu_Icon.png"
                    }

                    onClicked: {
                        if ( App_Settings.logged_in === false)
                        {
//                            login_dialog.open()
                            login_dialog_loader.sourceComponent = login_dialog_component
                        }
                        else
                            main_menu.open()

                    }
                }
            }
    }

    Main_Menu {}

    GridLayout {
        id: grid
        columns: 3
        columnSpacing: 30
        rowSpacing: 20
        anchors {
            fill: parent
            centerIn: parent
            margins: 30
        }

        Icon_Button {
            id: projector_button
            icon: "Icons/Projector_Icon.png"
            name: "Projector On/Off"
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        Icon_Button {
            id: aircon_button
            icon: "Icons/Aircon_Icon.png"
            name: "Aircon On/Off"
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        Icon_Button {
            id: lights_button
            icon: "Icons/Lights_On_Icon.png"
            name: "Lights On/Off"
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        Icon_Button {
            id: volume_up_button
            icon: "Icons/Volume_Up_Icon.png"
            name: "Increace Volume"
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        Icon_Button {
            id: volume_down_button
            icon: "Icons/Volume_Down_Icon.png"
            name: "Decreace Volume"
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
    }

    Loader {
        id: login_dialog_loader
        anchors.centerIn: parent
    }

    Component{
        id: login_dialog_component
        Login_Dialog {
            id: login_dialog
            focus: true
            width: window.width/3 < minimum_width ? minimum_width : window.width/3
            height: window.height/1.5 < minimum_height ? minimum_height : window.height/1.5
            onCancel_clicked: login_dialog_loader.sourceComponent = undefined
            onLogin_clicked: {
                App_Settings.logged_in = true
                console.log ("Username: " + username + "\nPassword: " + password)
                login_dialog_loader.sourceComponent = undefined
            }
        }
    }

    Loader {
        id: settings_menu_loader
    }

    Component {
        id: settings_menu_component
        Side_Panel {
            id: drawer
        }
    }

    Main_Menu {
        id: main_menu
//        y: app_header.height
        anchors.right: parent.right
    }
}
