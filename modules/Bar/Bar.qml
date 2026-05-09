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
        // Keep the window full-width for the strut/anchor,
        // but inset the visible bar to make it "float".
        implicitHeight: Theming.barHeight + (Theming.spacing * 2)
        color: "transparent"
        

        Rectangle {
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.leftMargin: Theming.spacingXs
            anchors.rightMargin: Theming.spacingXs
            anchors.topMargin: Theming.spacingXs
            height: Theming.barHeight
            bottomLeftRadius: 32
            bottomRightRadius: 32
            topRightRadius: 32
            topLeftRadius: 32
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
                        spacing: 3

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
                        
                        Volume {}
                        Quicksettings {}
                        Connections {}
                        Powerbutton {}
                    }
                }
            }
        }
    }
}