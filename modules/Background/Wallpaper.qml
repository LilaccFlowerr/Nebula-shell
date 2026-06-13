import QtQuick
import Quickshell
import qs.Services

Item {
    id: root

    property var modelData
    property string screenName: modelData?.name ?? ""
    property var currentImage: img1
    property string source: ""
    property int transitionType: 1 // 0: fade, 1: slide left, 2: push left, 3: push right

    anchors.fill: parent

    function applyTransition(newImage, oldImage) {
        var w = root.width
        var h = root.height
        oldImage.opacity = 1
        oldImage.scale = 1
        oldImage.x = 0
        oldImage.y = 0
        oldImage.rotation = 0

        switch (transitionType) {
        case 0:
            newImage.opacity = 0
            newImage.x = 0
            newImage.y = 0
            newImage.scale = 1
            newImage.rotation = 0
            break
        case 1:
            newImage.opacity = 0
            newImage.x = w * 1.5
            newImage.y = 0
            newImage.scale = 1
            newImage.rotation = 0
            oldImage.opacity = 0
            oldImage.x = 0
            oldImage.y = 0
            oldImage.scale = 1
            oldImage.rotation = 0
            break
        case 2:
            newImage.x = -w
            newImage.y = 0
            newImage.scale = 1
            newImage.rotation = 0
            newImage.opacity = 1
            oldImage.x = w * 1.5 
            break
        case 3:
            newImage.x = w
            newImage.y = 0
            newImage.scale = 1
            newImage.rotation = 0
            newImage.opacity = 1
            oldImage.x = -w * 1.5
            break
        }

        img1Container.z = (newImage === img1) ? 2 : 1
        img2Container.z = (newImage === img2) ? 2 : 1
        root.currentImage = newImage

        animateTimer.newImg = newImage
        animateTimer.oldImg = oldImage
        animateTimer.start()
    }

    onSourceChanged: {
        if (source === "") return
        var next = (currentImage === img1) ? img2 : img1
        var old = currentImage
                // next.opacity = 1
                // next.scale = 1
                // next.x = 0
                // next.y = 0
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
        id: animateTimer
        interval: 950
        repeat: false
        property var newImg
        property var oldImg
        onTriggered: {
            newImg.opacity = 1
            newImg.scale = 1
            newImg.x = 0
            newImg.y = 0
            newImg.rotation = 0
            oldImg.opacity = 0
            cleanupTimer.oldImg = oldImg
            cleanupTimer.start()
        }
    }

    Timer {
        id: cleanupTimer
        interval: 950
        repeat: false
        property var oldImg
        onTriggered: {
            oldImg.x = 0
            oldImg.y = 0
            oldImg.scale = 1
            oldImg.rotation = 0
        }
    }

    Item {
        id: img1Container
        anchors.fill: parent

        Image {
            id: img1
            width: parent.width
            height: parent.height
            fillMode: Image.PreserveAspectCrop
            smooth: true
            clip: false
            opacity: root.currentImage === img1 ? 0 : 0

            Behavior on opacity {
                enabled: transitionType
                NumberAnimation { duration: 900; easing.type: Easing.InOutCubic }
            }
            Behavior on x {
                NumberAnimation { duration: 900; easing.type: Easing.InOutCubic }
            }
            Behavior on y {
                NumberAnimation { duration: 900; easing.type: Easing.InOutCubic }
            }
            Behavior on scale {
                NumberAnimation { duration: 900; easing.type: Easing.InOutCubic }
            }
            Behavior on rotation {
                NumberAnimation { duration: 900; easing.type: Easing.InOutCubic }
            }
        }
    }

    Item {
        id: img2Container
        anchors.fill: parent

        Image {
            id: img2
            width: parent.width
            height: parent.height
            fillMode: Image.PreserveAspectCrop
            smooth: true
            clip: false
            opacity: root.currentImage === img2 ? 0 : 0

            Behavior on opacity {
                enabled: transitionType
                NumberAnimation { duration: 900; easing.type: Easing.InOutCubic }
            }
            Behavior on x {
                NumberAnimation { duration: 900; easing.type: Easing.InOutCubic }
            }
            Behavior on y {
                NumberAnimation { duration: 900; easing.type: Easing.InOutCubic }
            }
            Behavior on scale {
                NumberAnimation { duration: 900; easing.type: Easing.InOutCubic }
            }
            Behavior on rotation {
                NumberAnimation { duration: 900; easing.type: Easing.InOutCubic }
            }
        }
    }
}