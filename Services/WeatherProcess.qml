import Quickshell
import Quickshell.Io
import QtQuick

Item {
    property string weatherOutput: ""

    Process {
        id: weatherProc
        command: ["sh", "-c", "curl -s 'wttr.in/?format=%t'"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: weatherOutput = this.text.trim()
        }
    }

    Timer {
        interval: 600000
        running: true
        repeat: true
        onTriggered: weatherProc.running = true
    }
}