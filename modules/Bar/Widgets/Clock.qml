import QtQuick
import QtQuick.Layouts
import qs.Core
import Quickshell.Widgets


Rectangle{
    color: Theming.colMuted + "55"
    topLeftRadius: 999
    bottomLeftRadius: 999
    Layout.alignment: Qt.AlignVCenter
    implicitWidth: clock.implicitWidth + 16
    implicitHeight: clock.implicitHeight
Text {
    id: clock
    Layout.alignment: Qt.AlignVCenter
    text: Qt.formatDateTime(new Date(), "HH:mm:ss")
    color: Theming.colBlue
    font.family:  Theming.fontVapor
    font.pixelSize: Theming.fontSizeXxl
    font.bold: true
    font.styleName: "Normal"
    anchors.centerIn: parent
    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: clock.text = Qt.formatDateTime(new Date(), "HH:mm:ss")
    }
}

}