import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import Quickshell.Widgets
import QtQuick.Layouts
import Quickshell.Io
import "Widgets"
import "Widgets/Buttons"
import "../../Core"

Variants {
model: Quickshell.screens


PanelWindow {
    id: root
    
    required property var modelData
    screen: modelData
    //theming
    Theming {
        id: theme
    }

    property color colBg: theme.colBg
    property color colCyan: theme.colCyan
    property color colPink: theme.colPink
    property color colBlue: theme.colBlue
    property color colYellow: theme.colYellow
    property color colMuted: theme.colMuted
    property string fontFamily: theme.fontFamily
    property int fontSize: theme.fontSize

    //system data

    // cpu

    anchors.top: true
    anchors.left: true
    anchors.right: true
    implicitHeight: 40
    color: "transparent"
    Rectangle {
        anchors.fill: parent
        bottomLeftRadius: 32
        bottomRightRadius: 32
    color: root.colBg

    RowLayout {
        anchors.fill: parent
        anchors.margins: 8
        spacing: 10

        Logo {}

        Workspaces {}

        Item {
            Layout.fillWidth: true
        }

        Clock {}

        Item {
            Layout.fillWidth: true
        }

        Systemvitals {}

        Powerbutton {}
        }
    }
}
}
