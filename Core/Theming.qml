pragma Singleton
import QtQuick
import Quickshell

QtObject {

 
    readonly property color colBg:          "#1a1b26"   // main background
    readonly property color colBgDeep:      "#13141f"   // deeper bg (bars, panels)
    readonly property color colBgFloat:     "#1f2030"   // floating surfaces, cards
    readonly property color colBgHighlight: "#292e42"   // hover / selection bg
    readonly property color colBgVisual:    "#33467c"   // visual select, active item

    
    readonly property color colFg:          "#c0caf5"   // primary text
    readonly property color colFgDark:      "#a9b1d6"   // slightly dimmed text
    readonly property color colFgGutter:    "#3b3d57"   // line numbers / gutters
    readonly property color colMuted:       "#414868"   // disabled / placeholder text
    readonly property color colSecondary:   "#575759"   // secondary ui elements
    readonly property color colComment:     "#565f89"   // comments, subtitles

  
    readonly property color colBlue:        "#7aa2f7"   // primary accent
    readonly property color colBlueBright:  "#2ac3de"   // bright blue
    readonly property color colCyan:        "#0db9d7"   // cyan / links
    readonly property color colTeal:        "#1abc9c"   // teal variant
    readonly property color colGreen:       "#9ece6a"   // success / strings
    readonly property color colGreenBright: "#73daca"   // bright green
    readonly property color colYellow:      "#e0af68"   // warnings / tags
    readonly property color colOrange:      "#ff9e64"   // constants / numbers
    readonly property color colRed:         "#f7768e"   // errors / deletions
    readonly property color colPink:        "#ff007c"   // bold pink
    readonly property color colMagenta:     "#bb9af7"   // purple / keywords
    readonly property color colPurple:      "#9d7cd8"   // deeper purple
    readonly property color colWhite:       "#cfc9c2"   // near-white

    
    readonly property color colSuccess:     "#9ece6a"   // success states
    readonly property color colWarning:     "#e0af68"   // warning states
    readonly property color colError:       "#f7768e"   // error states
    readonly property color colInfo:        "#7aa2f7"   // info / neutral notice

  
    readonly property color colBorder:      "#292e42"   // default border
    readonly property color colBorderFocus: "#7aa2f7"   // focused border
    readonly property color colDivider:     "#1f2030"   // subtle divider lines

 
    readonly property color colBgAlpha80:   "#cc1a1b26" // bg at 80% opacity
    readonly property color colBgAlpha60:   "#991a1b26" // bg at 60% opacity
    readonly property color colBgAlpha40:   "#661a1b26" // bg at 40% opacity (popups)
    readonly property color colOverlay:     "#801a1b26" // modal overlay tint
    readonly property color colShadow:      "#8013141f" // drop shadow color

   
    readonly property string fontFamily:    "JetBrains Nerd Font"
    readonly property string fontFamilyMono:"JetBrainsMono Nerd Font"
    readonly property string fontFamilyUI:  "Inter"     // clean UI font fallback

    readonly property int    fontSizeXs:    10
    readonly property int    fontSizeSm:    12
    readonly property int    fontSize:      14          // base / body
    readonly property int    fontSizeMd:    15
    readonly property int    fontSizeLg:    16
    readonly property int    fontSizeXl:    20
    readonly property int    fontSizeXxl:   28          // clock / big headers
    readonly property int    fontSizeHero:  48          // large clock display

    readonly property int    fontWeightLight:  300
    readonly property int    fontWeightNormal: 400
    readonly property int    fontWeightMedium: 500
    readonly property int    fontWeightBold:   700

    readonly property int    spacingXxs:    2
    readonly property int    spacingXs:     4
    readonly property int    spacingSm:     6
    readonly property int    spacing:       8           // base spacing unit
    readonly property int    spacingMd:     12
    readonly property int    spacingLg:     16
    readonly property int    spacingXl:     24
    readonly property int    spacingXxl:    32

    readonly property int    radiusNone:    0
    readonly property int    radiusSm:      4
    readonly property int    radius:        6           // default corner radius
    readonly property int    radiusMd:      8
    readonly property int    radiusLg:      12
    readonly property int    radiusPill:    999         // fully rounded / pill shape

    readonly property int    barHeight:     32
    readonly property int    barPadding:    8
    readonly property int    barIconSize:   16
    readonly property int    barModuleGap:  6

    readonly property int    iconSm:        14
    readonly property int    iconMd:        18
    readonly property int    iconLg:        24
    readonly property int    iconXl:        32

    readonly property int    durationFast:  100
    readonly property int    duration:      200         // default transition
    readonly property int    durationSlow:  350
    readonly property int    durationLazy:  500

    readonly property int    easingType:    Easing.OutCubic
    readonly property int    easingSpring:  Easing.OutBack

    readonly property real   opacityFull:       1.0
    readonly property real   opacityHover:      0.85
    readonly property real   opacityDisabled:   0.4
    readonly property real   opacitySubtle:     0.6
    readonly property real   opacityGhost:      0.2
}