import Quickshell
import Qt5Compat.GraphicalEffects
import QtQuick
import QtQuick.Window
import Quickshell.Widgets
import Quickshell.Wayland
import QtQuick.Layouts
import qs.Services
import qs.Core
    PanelWindow {
        id: wallpaperMenu
property bool isOpen: false
property var globalState
        visible: isOpen
        color: "#00000000"
        WlrLayershell.layer: WlrLayer.Overlay
        WlrLayershell.keyboardFocus: WlrKeyboardFocus.None
        WlrLayershell.exclusiveZone: -1
        anchors {
            top: true
            bottom: true
            left: true
            right: true
        }
        
        MouseArea {
            anchors.fill: parent
            z: -1
            onClicked: globalState.wallpaperMenuOpen = false
        }
        
        
        Rectangle {
                color: Theming.colBg
                radius: 8
                width: 1270
                height: 720
                anchors.centerIn: parent
                
                
                RowLayout {
                    anchors.fill: parent
                    anchors.margins: 20
                    spacing: 30
                   
                   
                    Repeater {
                        model: 1
                        Item {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                            
                            
                            
                            GridView {
                                id: grid
                                anchors.fill: parent
                                anchors.margins: 10
                                model: context.wallpaperProcess.wallpapers
                                clip: true
                                property int columns: 3
                                cellWidth: width / columns
                                cellHeight: cellWidth / (16/9)
                                delegate: Rectangle {
                                width: grid.cellWidth - 10
                                height: grid.cellHeight - 10
                                radius: 12
                                layer.enabled: true
                                layer.effect: null
                   
                   
                   
                                Image {
                                    id: img
                                    anchors.fill: parent
                                    source: context.wallpaperProcess.wallpapers.folder + "/" + model.fileName
                                    sourceSize.width: 800
                                    sourceSize.height: 500
                                    fillMode: Image.PreserveAspectCrop
                                    asynchronous: true
                                    layer.enabled: true
                                    layer.effect: OpacityMask {
                                        maskSource: Rectangle {
                                            width: img.width
                                            height: img.height
                                            radius: 12
                                        }
                                    }
                                }
                   
                   
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: context.wallpaperProcess.changeWallpaper(
                                        modelData.name,
                                        model.filePath
                                    )
                                    
                                }
                            }
                        }
                    }
                }
            }
        }
}