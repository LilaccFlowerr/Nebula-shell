import Quickshell
import QtQuick
import qs.Core
import qs.Services


Item {
    id: root

    property alias appState: appStateService
    property alias wallpaperProcess: wallpaperProcess

    GlobalState {
        id: appStateService
    }

    WallpaperProcess {
        id: wallpaperProcess
    }

}
