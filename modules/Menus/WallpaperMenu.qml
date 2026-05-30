import Quickshell
import QtQuick
import QtQuick.Window
import Quickshell.Widgets
import QtQuick.Layouts
import qs.Services
import qs.Core


PanelWindow {
    id: wallpaperMenu

    property bool isOpen: false
    property var globalState

    implicitWidth: 1300
    implicitHeight: 800


    visible: isOpen
    color: "#00000000"

Rectangle {
        anchors.fill: parent
        color: Theming.colBg
        radius: 8
        RowLayout {
            anchors.fill: parent
            anchors.margins: 20
            spacing: 20
        
            Repeater {
                model: Quickshell.screens

                Item {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }
            }

        
        }
     
    MouseArea {
        anchors.fill: parent
        onClicked: {
            globalState.wallpaperMenuOpen = false
        }
    }


    MouseArea {
        anchors.fill: parent
        onClicked: {
            globalState.wallpaperMenuOpen = false
        }
        Text {
            anchors.centerIn: parent
            text: "Change Wallpaper"
            
        }
    }

}

}
