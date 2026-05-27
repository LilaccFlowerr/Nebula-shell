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

    readonly property var buttonsModel: [{
        "text": "Power Off",
        "command": "systemctl poweroff"
    }, {
        "text": "Restart",
        "command": "systemctl reboot"
    }, {
        "text": "Reload",
        "command": "pkill qs && qs -c Nebula-shell &"
    }]

    function runCommand(cmd) {
        Quickshell.execDetached(["sh", "-c", cmd]);
        globalState.powerMenuOpen = false;
    }
    
    implicitWidth: Screen.width
    implicitHeight: Screen.height
    visible: isOpen
    color: '#00000000'

    MouseArea {
        anchors.fill: parent
        onClicked: globalState.powerMenuOpen = false
    }

    Rectangle {
        anchors.fill: parent
        radius: 24
        color: "transparent"

        Row {
            anchors.centerIn: parent
            spacing: 60

            Repeater {
                model: root.buttonsModel

                Rectangle {
                    required property var modelData
                    width: 200
                    height: 200
                    radius: 60
                    color: mouseArea.containsMouse ? "#3a3a4a" : "#2a2a3a"
                    border.width: 1
                    border.color: "#4a4a5a"

                    Text {
                        anchors.centerIn: parent
                        text: parent.modelData.text
                        color: "#c0caf5"
                        font.pixelSize: 14
                    }

                    MouseArea {
                        id: mouseArea
                        anchors.fill: parent
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                        onClicked: root.runCommand(parent.modelData.command)
                    }
                }
            }
        }
    }
}
