import Quickshell
import "modules/Bar"
import qs.Core
import "Overlays"
import "modules/Background"

ShellRoot {
    Context {
        id: context
    }

    Bar {
    }

    Overlays {
        context: context
    }

    Background {
    }
}
