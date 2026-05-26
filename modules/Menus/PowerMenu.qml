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
    color: "#22000000"

    MouseArea {
        anchors.fill: parent
        onClicked: globalState.powerMenuOpen = false
    }

    Rectangle {
        anchors.fill: parent
        radius: 24
        color: "transparent"

        ColumnLayout {
            anchors.centerIn: parent
            spacing: 12

            Repeater {
                model: root.buttonsModel

                Button {
                    required property var modelData

                    text: modelData.text
                    Layout.alignment: Qt.AlignHCenter
                    onClicked: root.runCommand(modelData.command)
                }
            }
        }
    }
}
