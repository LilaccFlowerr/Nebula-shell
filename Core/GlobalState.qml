import QtQuick

QtObject {
    id: root

    property bool powerMenuOpen: false
    property bool wallpaperMenuOpen: false


    function togglePowerMenu() {
        if (powerMenuOpen) {
            powerMenuOpen = false;
        } else {
            closeAll();
            powerMenuOpen = true;
        }
    }

    function toggleWallpaperMenu() {
        if (wallpaperMenuOpen) {
            wallpaperMenuOpen = false;
        } else {
            closeAll();
            wallpaperMenuOpen = true;
        }
    }

    function closeAll() {
        powerMenuOpen = false;
        wallpaperMenuOpen = false;
    }

}
