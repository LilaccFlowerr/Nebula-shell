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

function onWallpaperChanged(changedScreen, path) {
    if (changedScreen !== screenName && changedScreen !== "all") return
    console.log("past the guard")
    root.source = ""
    root.source = "file://" + path
}

    function changeWallpaper(screenName, path) {
        wallpaperMap["wallpaper"] = path
        var jsonContent = JSON.stringify(wallpaperMap, null, 4)
        var configPath = Quickshell.env("HOME") + "/.config/quickshell/Nebula-shell/wallpapers.json"

        writeProc.command = ["sh", "-c", "cat > '" + configPath + "'"]
        writeProc.running = true
        writeProc.write(jsonContent)
        writeProc.write("\n")
        writeProc.stdinEnabled = false
        writeProc.stdinEnabled = true  

        wallpaperChanged(screenName, expandPath(path))
    }

    Process {
        id: writeProc
        stdinEnabled: true
        onExited: (code, status) => {
            if (code !== 0)
                console.warn("wallpaper write failed with exit code:", code)
        }
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