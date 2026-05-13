import QtQuick
import Quickshell.Widgets
import QtQuick.Layouts
import qs.Core

Item {
    id: powerButton
    implicitWidth: 24
    implicitHeight: 24
     MouseArea {
        anchors.fill: parent
        onClicked: Ipc.togglePowerMenu()
    }
Rectangle {
        anchors.fill: parent
        color: Theming.colWorkspaceInactiveBg
        radius: 60
        implicitWidth: parent.implicitWidth + 16
        implicitHeight: parent.implicitHeight + 16
    
    Text {
        anchors.centerIn: parent
        text: "\uF011"
        color: Theming.colCrtRed
        font.family: Theming.fontVapor
        font.pixelSize: 18
    }
}
}
