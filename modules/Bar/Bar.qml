import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import Quickshell.Widgets
import QtQuick.Layouts
import Quickshell.Io
import "Widgets"
import "Widgets/Buttons"
import "Widgets/Weather"
import qs.Core

Variants {
    model: Quickshell.screens

    PanelWindow {
        id: root
        required property var modelData
        screen: modelData

        anchors.top: true
        anchors.left: true
        anchors.right: true
        implicitHeight: 40
        color: "transparent"

        Rectangle {
            anchors.fill: parent
            bottomLeftRadius: 32
            bottomRightRadius: 32
            color: Theming.colBgDeep
            
            RowLayout {
                anchors.fill: parent
                anchors.margins: 8
                spacing: 10

                Item {
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    RowLayout {
                        anchors.left: parent.left
                        anchors.verticalCenter: parent.verticalCenter
                        spacing: 10

                        Logo {}
                        Workspaces {}
                    }
                }

                Item {
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    RowLayout {
                        anchors.centerIn: parent
                        spacing: 2

                        Clock {}
                        WeatherBar {}
                    }
                }

                Item {
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    RowLayout {
                        anchors.right: parent.right
                        anchors.verticalCenter: parent.verticalCenter
                        spacing: 10

                        Systemvitals {}
                        Powerbutton {}
                    }
                }
            }
        }
    }
}