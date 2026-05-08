import QtQuick
import Quickshell
import QtQuick.Layouts
import Quickshell.Hyprland
import Quickshell.Widgets
import "../../../Core"


Item {
Layout.alignment: Qt.AlignVCenter
    implicitWidth: pillBg.implicitWidth
    implicitHeight: pillBg.implicitHeight

    Rectangle {
        id: pillBg
        anchors.fill: parent
        implicitWidth: root.implicitWidth + 16
        implicitHeight: root.implicitHeight + 6
        radius: 999
        color: root.colMuted + "44"
    }

RowLayout {
    id: root
        anchors.centerIn: parent
        spacing: 4

    Theming {
        id: theme
    }

    property color colCyan: theme.colCyan
    property color colPink: theme.colPink
    property color colMuted: theme.colMuted
    property color colSecondary: theme.colSecondary
    property int fontSize: theme.fontSize

    Layout.alignment: Qt.AlignVCenter
    


    Repeater {
        model: 9
        Rectangle {
            property var ws: Hyprland.workspaces.values.find(w => w.id === index + 1)
            property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)
            id: workspace
            width: 20
            height: 20
            radius: 16
            color: isActive ? root.colSecondary : (root ? root.colMuted : root.colMuted)
            
        Text {
            anchors.centerIn: parent
            text: index + 1
                color: "white"
                    font {
                        pixelSize: root.fontSize
                        bold: true
                    }

                MouseArea {
                    anchors.fill: parent
                    onClicked: Hyprland.dispatch("workspace " + (index + 1))
                }
        }
    }
}
}
}