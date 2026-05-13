import QtQuick
import Quickshell
import Quickshell.Io
import qs.Core

Item {
    id: root

    required property Context context


   
    PowerMenu {
        id: powermenu

        isOpen: root.context.appState.powerMenuOpen
        globalState: root.context.appState
    }


    IpcHandler {
        function toggle() {
            root.context.appState.togglePowerMenu();
        }

        target: "powermenu"
    }

}
