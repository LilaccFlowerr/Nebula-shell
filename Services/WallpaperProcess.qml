import QtQuick
import Quickshell
import Quickshell.Io

QtObject {
    id: root

    property bool isInitialized: false

    signal wallpaperChanged(string screenName, string path)

    function getWallpaper(screenName) {
        // dumb hardcoded for now
        return "../../Assets/wallpaper.png"
    }

    Component.onCompleted: {
        isInitialized = true
    }
}