import QtQuick
import qs.Core
import Quickshell.Widgets

Item {
    implicitWidth: logo.implicitWidth
    implicitHeight: logo.implicitHeight

    Image {
        id: logo
        anchors.centerIn: parent
        sourceSize.width: 25
        sourceSize.height: 25
        source: "../../../Assets/arch.svg"
    }
}
