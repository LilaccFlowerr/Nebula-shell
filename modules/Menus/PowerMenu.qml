import Quickshell
import QtQuick
import qs.Core
import Quickshell.Widgets
import QtQuick.Layouts

Item {
    id: powerMenu

    property bool open: false

    Item {
        id: menu
        x: powerButton.x + powerButton.width / 2 - width / 2
        y: powerButton.y + powerButton.height + 8
        visible: powerMenu.open
        onVisibleChanged: if (!visible) powerMenu.open = false

        Item {
            text: "Shutdown"
            onTriggered: Quickshell.runDetached("systemctl poweroff")
        }
        Item {
            text: "Restart"
            onTriggered: Quickshell.runDetached("systemctl reboot")
        }
        Item {
            text: "Sleep"
            onTriggered: Quickshell.runDetached("systemctl suspend")
        }
    }
}