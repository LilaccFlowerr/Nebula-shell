import QtQuick
import QtQuick.Layouts
import qs.Core
Text {
    id: clock
    Layout.alignment: Qt.AlignVCenter
    text: Qt.formatDateTime(new Date(), "ddd, MMM dd - HH:mm")
    color: Theming.colSecondary
    font.family: Theming.fontFamily
    font.pixelSize: Theming.fontSize
    font.bold: true

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: clock.text = Qt.formatDateTime(new Date(), "ddd, MMM dd - HH:mm")
    }
}