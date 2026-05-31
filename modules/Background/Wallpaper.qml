import QtQuick
import Quickshell
import qs.Services

Item {
    id: root

    property var modelData
    property string screenName: modelData?.name ?? ""
    property var currentImage: img1
    property string source: ""
    property int transitionType: 0

    anchors.fill: parent

    function applyTransition(newImage, oldImage) {
        var w = root.width
        var h = root.height
        oldImage.opacity = 1
        oldImage.scale = 1
        oldImage.x = 0
        oldImage.y = 0

        switch (transitionType) {
        case 0:
            newImage.opacity = 0
            newImage.x = 0
            newImage.y = 0
            newImage.scale = 1
            break
        case 1:
            newImage.opacity = 1
            newImage.x = w
            newImage.y = 0
            newImage.scale = 1
            break
        }

        img1Container.z = (newImage === img1) ? 2 : 1
        img2Container.z = (newImage === img2) ? 2 : 1
        root.currentImage = newImage

        Qt.callLater(function() {
            newImage.opacity = 1
            newImage.scale = 1
            newImage.x = 0
            newImage.y = 0
            oldImage.opacity = 0
            if (transitionType === 1) oldImage.x = -w
            transitionTimer.start()
        })
    }

    onSourceChanged: {
        if (source === "") return
        var next = (currentImage === img1) ? img2 : img1
        var old = currentImage
        next.opacity = 0
        next.scale = 1
        next.x = 0
        next.y = 0
        next.source = root.source
        Qt.callLater(function() {
            if (next.status === Image.Ready)
                applyTransition(next, old)
        })
    }

    Connections {
        target: context.wallpaperProcess

        function onWallpaperChanged(changedScreen, path) {
            if (changedScreen !== screenName && changedScreen !== "all") return
            var fullPath = "file://" + path
            if (img1.source === "")
                img1.source = fullPath
            else {
                root.source = ""
                root.source = fullPath
            }
        }

        function onIsInitializedChanged() {
            var path = context.wallpaperProcess.getWallpaper(screenName)
            if (context.wallpaperProcess.isInitialized && path !== "")
                img1.source = "file://" + path
        }
    }

    Timer {
        id: transitionTimer
        property var callback
        interval: 900
        repeat: false
        onTriggered: if (callback) callback()
    }

    Item {
        id: img1Container
        anchors.fill: parent

        Image {
            id: img1
            anchors.fill: parent
            fillMode: Image.PreserveAspectCrop
            smooth: true
            opacity: root.currentImage === img1 ? 1 : 0

            Behavior on opacity {
                NumberAnimation { duration: 900; easing.type: Easing.InOutCubic }
            }
            Behavior on x {
                NumberAnimation { duration: 900; easing.type: Easing.InOutCubic }
            }
        }
    }

    Item {
        id: img2Container
        anchors.fill: parent

        Image {
            id: img2
            anchors.fill: parent
            fillMode: Image.PreserveAspectCrop
            smooth: true
            opacity: root.currentImage === img2 ? 1 : 0

            Behavior on opacity {
                NumberAnimation { duration: 900; easing.type: Easing.InOutCubic }
            }
            Behavior on x {
                NumberAnimation { duration: 900; easing.type: Easing.InOutCubic }
            }
        }
    }
}