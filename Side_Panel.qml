import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import "."

Drawer {
    id: drawer

//    visible: true
    y: app_header.height
    height: window.height
    width: window.width *0.65
    ListView {
        id: side_panel
        anchors.fill: parent
        visible: true
        header: Pane {
            id: pane_header
            width: parent.width
            contentHeight: logo.height + col_layout.height
            Image {
                id: logo
                width: parent.width
                source: "Icons/NWU_Icon.png"
                fillMode: implicitWidth > width ? Image.PreserveAspectFit : Image.Pad
            }
            ColumnLayout {
                id: col_layout
                anchors.top: logo.bottom
                width: parent.width
                MenuSeparator {
                    width: parent.width * 0.95
                    anchors.horizontalCenter: parent.horizontalCenter
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                }

                Label {
                    text: qsTr("Setup Menu")
                    Layout.alignment: Qt.AlignHCenter
                    font.bold: true
                }

                MenuSeparator {
                    width: parent.width * 0.95
                    anchors.horizontalCenter: parent.horizontalCenter
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                }
            }
        }



        delegate: ItemDelegate {
            width: parent.width
            text: model.title
            onClicked: {
                console.log ("Button pressed: " + model.title )
                drawer.close()
            }
        }
        model: ListModel {
            ListElement { title: "test1" }
            ListElement { title: "test2" }
        }

//        states: [
//            State{
//                name: "hidden"; when: !App_Settings.logged_in
////                PropertyChanges { target: side_panel; visible: false }
//                PropertyChanges { target: drawer; width: 0 }
//            }
//        ]
    }
}
