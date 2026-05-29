import QtQuick
import Quickshell
import qs.Services

Item {
    id: root
    property var modelData
    property string screenName: modelData?.name ?? ""

    Image {
        id: img
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
    }

    Component.onCompleted: {
        img.source = context.wallpaperProcess.getWallpaper(screenName)
    }

    Connections {
        target: context.wallpaperProcess
        function onWallpaperChanged(changedScreen, path) {
            img.source = path
        }
    }
}