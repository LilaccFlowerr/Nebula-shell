import QtQuick
import Quickshell
import Quickshell.Io
pragma Singleton

Singleton {
    id: root

    function togglePowerMenu() {
        powerMenuProc.running = true;
    }

    function toggleWallpaperMenu() {
        wallpaperMenuProc.running = true;
    }


    Process {
        id: powerMenuProc
        command: ["quickshell", "ipc", "-c", "Nebula-shell", "call", "powermenu", "toggle"]
        running: false
    }

    Process {
        id: wallpaperMenuProc
        command: ["quickshell", "ipc", "-c", "Nebula-shell", "call", "wallpapermenu", "toggle"]
        running: false
    
    }

}
