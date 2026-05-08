import QtQuick
import QtQuick.Layouts
import qs.Core
import "../../../Services"

RowLayout {
    spacing: 8
    Layout.alignment: Qt.AlignVCenter

    CpuProcess { id: cpu }
    MemProcess  { id: mem }

    Text {
        text: "CPU: " + cpu.cpuUsage + "%"
        color: Theming.colYellow
        font.family: Theming.fontFamily
        font.pixelSize: Theming.fontSize
        font.bold: true
    }

    Rectangle { width: 1; height: 16; color: Theming.colMuted }

    Text {
        text: "Mem: " + mem.memUsage + "%"
        color: Theming.colCyan
        font.family: Theming.fontFamily
        font.pixelSize: Theming.fontSize
        font.bold: true
    }

    Rectangle { width: 1; height: 16; color: Theming.colMuted }
}