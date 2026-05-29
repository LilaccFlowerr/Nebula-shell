import QtQuick
import Quickshell
import Quickshell.Io

Item {
    id: root

    property bool isInitialized: false
    property var wallpaperMap: ({})

    signal wallpaperChanged(string screenName, string path)

    function expandPath(path) {
        return path.replace("~/", Quickshell.env("HOME") + "/")
    }

    function reload() {
        var content = configFile.text()
        console.log("config text:", content)
        if (content.trim() === "") return
        try {
            wallpaperMap = JSON.parse(content)
            isInitialized = true
            wallpaperChanged("all", expandPath(wallpaperMap["wallpaper"]))
        } catch (e) {
            console.warn("wallpaper config parse failed:", e)
        }
    }

    function getWallpaper(screenName) {
        return expandPath(wallpaperMap["wallpaper"] ?? "")
    }

    FileView {
        id: configFile
        path: Quickshell.env("HOME") + "/.config/quickshell/Nebula-shell/wallpapers.json"
        watchChanges: true
        onTextChanged: root.reload()
    }

    Component.onCompleted: {
        isInitialized = true
        reload()
    }
}