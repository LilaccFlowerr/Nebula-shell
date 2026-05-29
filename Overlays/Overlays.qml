import QtQuick
import Quickshell
import Quickshell.Io
import qs.Core
import "../modules/Menus"

Item {
    id: root

    required property Context context

    PowerMenu {
        id: powermenu

        isOpen: root.context.appState.powerMenuOpen
        globalState: root.context.appState
    }

    WallpaperMenu {
        id: wallpapermenu

        isOpen: root.context.appState.wallpaperMenuOpen
        globalState: root.context.appState
    }


    IpcHandler {
        function toggle() {
            console.log("IPC received: powermenu toggle")
            root.context.appState.togglePowerMenu();
        }

        target: "powermenu"
    }

    IpcHandler {
        function toggle() {
            console.log("IPC received: wallpapermenu toggle")
            root.context.appState.toggleWallpaperMenu();
        }

        target: "wallpapermenu"
    }

}
