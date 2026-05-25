import Qt5Compat.GraphicalEffects
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import qs.Core

PanelWindow {
    id: root
    required property bool isOpen
    required property var globalState
    
    implicitWidth: 400
    implicitHeight: 400
    visible: isOpen
    color: '#22000000'
MouseArea {
        anchors.fill: parent
        onClicked: globalState.powerMenuOpen = false
    }
    Rectangle {
        anchors.fill: parent
        radius: 24
        color: '#110f0f'

        ColumnLayout {
            anchors.centerIn: parent
            spacing: 12

            Button {
                text: "Power Off"
                onClicked: {
                     Quickshell.execDetached(["sh", "-c", "systemctl poweroff"]);
                }
            }

            Button {
                text: "Restart"
                onClicked: {
                     Quickshell.execDetached(["sh", "-c", "systemctl reboot"]);
                }
            }
            Button {
                text: "Reload"
                onClicked: {
                     Quickshell.execDetached(["sh", "-c", "pkill qs && qs -c Nebula-shell &"]);
                }
            }
            }
        }
    }
