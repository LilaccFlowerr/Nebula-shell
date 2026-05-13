import Quickshell
import QtQuick
import qs.Core

Item {
    id: root

    property alias appState: appStateService

    GlobalState {
        id: appStateService
    }

}
