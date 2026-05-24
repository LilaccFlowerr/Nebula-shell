import Quickshell
import "modules/Bar"
import qs.Core
import "Overlays"

ShellRoot {
    Context {
        id: context
    }

    Bar {
    }

    Overlays {
        context: context
    }
}
