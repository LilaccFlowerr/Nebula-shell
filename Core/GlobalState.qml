import QtQuick

QtObject {
    id: root

    property bool powerMenuOpen: false


    function togglePowerMenu() {
        if (powerMenuOpen) {
            powerMenuOpen = false;
        } else {
            closeAll();
            powerMenuOpen = true;
        }
    }

    function closeAll() {
        powerMenuOpen = false;
    }

}
