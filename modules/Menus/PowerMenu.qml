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

    width: 400
    height: 400
    visible: isOpen

    Rectangle {
        anchors.fill: parent
        radius: 24
        color: "#1b1b1f"

        ColumnLayout {
            anchors.centerIn: parent
            spacing: 12

            Button {
                text: "Power Off"
            }

            Button {
                text: "Restart"
            }

            Button {
                text: "Sleep"
            }
        }
    }
}
