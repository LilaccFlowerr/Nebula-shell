import QtQuick
import Quickshell
import QtQuick.Layouts
import Quickshell.Hyprland
import qs.Core

Item {
    Layout.alignment: Qt.AlignVCenter
    implicitWidth: pillBg.implicitWidth
    implicitHeight: pillBg.implicitHeight

    Rectangle {
        id: pillBg
        anchors.fill: parent
        implicitWidth: row.implicitWidth + 16
        implicitHeight: row.implicitHeight + 6
        radius: 999
        color: Theming.colWorkspacePillBgAlpha
    }

    RowLayout {
        id: row
        anchors.centerIn: parent
        spacing: 4
        Layout.alignment: Qt.AlignVCenter

        Repeater {
            model: 9

            Rectangle {
                property var ws: Hyprland.workspaces.values.find(w => w.id === index + 1)
                property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)

                width: 20
                height: 20
                radius: 16
                color: isActive ? Theming.colWorkspaceActiveBg : Theming.colWorkspaceInactiveBg

                Text {
                    anchors.centerIn: parent
                    text: index + 1
                    color: isActive ? Theming.colWorkspaceActiveFg : Theming.colWorkspaceInactiveFg
                    font.pixelSize: Theming.fontSize
                    font.bold: true
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: Hyprland.dispatch("workspace " + (index + 1))
                }
            }
        }
    }
}