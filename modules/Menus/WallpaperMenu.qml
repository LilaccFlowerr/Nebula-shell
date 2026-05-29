import Quickshell
import QtQuick
import qs.Services

PanelWindow {
    id: wallpaperMenu
    property bool isOpen: false
    property var globalState
    visible: isOpen
    color: "#00000000"
    // title: "Wallpaper"

    // Item {
    //     text: "Change Wallpaper"
    //     onTriggered: {
    //         context.wallpaperProcess.changeWallpaper(model.screenName)
    //     }
    // }
}