import Quickshell
import Quickshell.Io
import QtQuick

Item {
    property string weatherOutput: ""

    Process {
        id: weatherProc
        command: ["sh", "-c", "curl -s 'https://api.open-meteo.com/v1/forecast?latitude=52.23&longitude=5.17&current_weather=true' | python3 -c \"import sys,json; d=json.load(sys.stdin)['current_weather']; print(d['weathercode'], d['temperature'])\""]
        running: true
        stdout: StdioCollector {
            onStreamFinished: weatherOutput = this.text.trim()
        }
    }

    Timer {
        interval: 600000 // 10 minutes
        running: true
        repeat: true
        onTriggered: weatherProc.running = true
    }
}