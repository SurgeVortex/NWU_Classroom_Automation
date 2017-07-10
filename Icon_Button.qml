import QtQuick 2.9
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0
import Qt.labs.settings 1.0

Item {
    id: container
    property alias icon: image_icon.source
    property alias name: button_name.text

    Settings {
        id: settings
        property bool activated: false
    }
    Rectangle {
        id: image_rect
        anchors.fill: container
        anchors.bottomMargin: parent.height * 0.10
        border.color: "#ff990000"
        color: "#ff990000"
        border.width: 5
        Image {
            id: image_icon
            anchors {
                fill: parent
                margins: 5
            }
            source: "Icons/Temporary_Icon.png"
        }
    }
    MouseArea {
        id: button_area
        anchors.fill: image_rect
        onPressed: image_rect.scale = 0.85
        onReleased: image_rect.scale = 1
        onClicked: {
            settings.activated = settings.activated ? settings.activated = false : settings.activated = true
            image_rect.border.color = settings.activated ? "#ff009900" : "#ff990000"
            image_rect.color = settings.activated ? "#ff009900" : "#ff990000"
        }
    }
    Text {
        id: button_name
        anchors {
            top: image_rect.bottom
            horizontalCenter: image_rect.horizontalCenter
        }
        font.pixelSize: (parent.height > parent.width ? parent.width : parent.height) * 0.1
        font.bold: true
        text: qsTr("Button Name")
    }
}
