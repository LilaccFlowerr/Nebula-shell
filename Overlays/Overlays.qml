import QtQuick
import Quickshell
import Quickshell.Io
import qs.Core
import qs.Modules.Panels

Item {
    id: root

    required property Context context


   
    PowerMenu {
        id: powerMenu

        isOpen: root.context.appState.powerMenuOpen
        globalState: root.context.appState
        colors: root.context.colors
    }


    IpcHandler {
        function toggle() {
            root.context.appState.togglePowerMenu();
        }

        target: "powermenu"
    }


}
