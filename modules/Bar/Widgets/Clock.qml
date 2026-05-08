import QtQuick
import QtQuick.Layouts
import qs.Core
Text {
    id: clock
    Layout.alignment: Qt.AlignVCenter
    text: Qt.formatDateTime(new Date(), "HH:mm:ss")
    color: Theming.colBlue
    font.family:  Theming.fontVapor
    font.pixelSize: Theming.fontSizeXxl
    font.bold: true
    font.styleName: "Normal"
    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: clock.text = Qt.formatDateTime(new Date(), "HH:mm:ss")
    }
}