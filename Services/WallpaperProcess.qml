import QtQuick
import Quickshell
import Quickshell.Io
import Qt.labs.folderlistmodel

Item {
    id: root

    property bool isInitialized: false
    property var wallpaperMap: ({})
    property alias wallpapers: folderModel

    signal wallpaperChanged(string screenName, string path)

    function expandPath(path) {
        return path.replace("~/", Quickshell.env("HOME") + "/")
    }

    function reload() {
        var content = configFile.text()
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

    function changeWallpaper(screenName, path) {
        wallpaperMap["wallpaper"] = path
        configFile.write(JSON.stringify(wallpaperMap, null, 4))
        wallpaperChanged(screenName, expandPath(path))
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

    FolderListModel {
    id: folderModel
    folder: "file://" + Quickshell.env("HOME") + "/Pictures/Wallpapers"
    nameFilters: ["*.jpg", "*.jpeg", "*.png", "*.webp", "*.gif"]
    showDirs: false
}
}