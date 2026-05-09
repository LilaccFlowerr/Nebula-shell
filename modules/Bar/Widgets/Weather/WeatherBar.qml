import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import "../../../../Services"
import qs.Core

Rectangle {
    color: Theming.colMuted + "55"
    topLeftRadius: 0
    bottomLeftRadius: 0
    topRightRadius: 999
    bottomRightRadius: 999
    Layout.alignment: Qt.AlignVCenter

    implicitWidth: weatherText.implicitWidth + 16
    implicitHeight: Math.max(weatherText.implicitHeight, Theming.fontSizeXxl)

    Process {
        id: weatherProc
        command: ["sh", "-c", "curl -s 'wttr.in/?format=%t'"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: weatherText.text = this.text.trim()
        }
    }

    Timer {
        interval: 600000
        running: true
        repeat: true
        onTriggered: weatherProc.running = true
    }

    Text {
        id: weatherText
        color: Theming.colBlue
        font.family:  Theming.fontVapor
        font.pixelSize: Theming.fontSizeXl
        anchors.centerIn: parent
    }
}