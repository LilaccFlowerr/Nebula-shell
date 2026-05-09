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

    // vaporwave palette
    readonly property color colVaporHotPink:   "#ff71ce"
    readonly property color colVaporPink:      "#ff9ff3"
    readonly property color colVaporPurple:    "#b967ff"
    readonly property color colVaporBlue:      "#01cdfe"
    readonly property color colVaporCyan:      "#05f3ff"
    readonly property color colVaporMint:      "#1ef6a8"
    readonly property color colVaporSunset:    "#ffb86c"
    readonly property color colVaporLilac:     "#c792ea"
    readonly property color colVaporText:      "#f8f1ff"
    readonly property color colVaporBg:        "#12071f"
    readonly property color colVaporBgDeep:    "#090312"
    readonly property color colVaporGlass:     Qt.rgba(0.92, 0.43, 0.87, 0.12)
    readonly property color colVaporBorder:    Qt.rgba(0.65, 0.38, 1.0, 0.55)
    readonly property color colVaporGlow:      Qt.rgba(1.0, 0.44, 0.81, 0.35)
    readonly property color colVaporShadow:    Qt.rgba(0.48, 0.06, 0.74, 0.42)
    readonly property color colVaporSelection:  Qt.rgba(0.0, 0.81, 0.99, 0.22)

    // vaporwave effect helpers
    readonly property color colVaporGradientStart: colVaporHotPink
    readonly property color colVaporGradientMid:    colVaporPurple
    readonly property color colVaporGradientEnd:    colVaporBlue
    readonly property color colVaporAccent:         colVaporPink
    readonly property color colVaporAccentAlt:      colVaporCyan
    readonly property color colVaporAccentDim:      Qt.rgba(colVaporPink.r, colVaporPink.g, colVaporPink.b, 0.55)
    readonly property color colVaporPulse:          Qt.rgba(colVaporBlue.r, colVaporBlue.g, colVaporBlue.b, 0.25)

    // crt palette
    readonly property color colCrtBg:            "#050607"
    readonly property color colCrtBgDeep:        "#000000"
    readonly property color colCrtText:          "#d6ffe6"
    readonly property color colCrtTextDim:       "#7fbf98"
    readonly property color colCrtGreen:         "#2cff7a"
    readonly property color colCrtPhosphor:      "#7dffb0"
    readonly property color colCrtAmber:         "#ffcf6b"
    readonly property color colCrtCyan:          "#66fff4"
    readonly property color colCrtMagenta:       "#ff66f0"
    readonly property color colCrtRed:           "#ff4d4d"
    readonly property color colCrtScanline:      Qt.rgba(0.0, 0.0, 0.0, 0.26)
    readonly property color colCrtShadow:        Qt.rgba(0.0, 0.0, 0.0, 0.72)
    readonly property color colCrtGlow:          Qt.rgba(0.17, 1.0, 0.48, 0.32)
    readonly property color colCrtGlowSoft:      Qt.rgba(0.17, 1.0, 0.48, 0.16)
    readonly property color colCrtBorder:        Qt.rgba(0.25, 1.0, 0.55, 0.35)
    readonly property color colCrtFlicker:       Qt.rgba(0.85, 1.0, 0.9, 0.06)
    readonly property color colCrtNoiseLight:    Qt.rgba(1.0, 1.0, 1.0, 0.03)
    readonly property color colCrtNoiseDark:     Qt.rgba(0.0, 0.0, 0.0, 0.08)

    // crt effect helpers
    readonly property color colCrtGradientStart:  colCrtGreen
    readonly property color colCrtGradientMid:    colCrtPhosphor
    readonly property color colCrtGradientEnd:    colCrtCyan
    readonly property color colCrtAccent:         colCrtAmber
    readonly property color colCrtAccentAlt:      colCrtMagenta
    readonly property color colCrtAccentDim:     Qt.rgba(colCrtAmber.r, colCrtAmber.g, colCrtAmber.b, 0.55)
    readonly property color colCrtPulse:         Qt.rgba(colCrtGreen.r, colCrtGreen.g, colCrtGreen.b, 0.22)

    // semantic accents (aliases / derived)
    readonly property color colPrimary:        colBlue
    readonly property color colPrimaryHover:   colBlueBright
    readonly property color colPrimaryDim:     Qt.darker(colBlue, 1.35)
    readonly property color colAccent:         colCyan
    readonly property color colAccentDim:      Qt.darker(colCyan, 1.25)
    readonly property color colDanger:         colRed
    readonly property color colDangerDim:      Qt.darker(colRed, 1.25)

    
    readonly property color colSuccess:     "#9ece6a"   // success states
    readonly property color colWarning:     "#e0af68"   // warning states
    readonly property color colError:       "#f7768e"   // error states
    readonly property color colInfo:        "#7aa2f7"   // info / neutral notice

    // interaction states
    readonly property color colHoverBg:        colBgHighlight
    readonly property color colPressedBg:      Qt.darker(colBgHighlight, 1.15)
    readonly property color colSelectedBg:     colBgVisual
    readonly property color colSelectedFg:     colFg
    readonly property color colFocusRing:      colBorderFocus

  
    readonly property color colBorder:      "#292e42"   // default border
    readonly property color colBorderFocus: "#7aa2f7"   // focused border
    readonly property color colDivider:     "#1f2030"   // subtle divider lines

 
    readonly property color colBgAlpha80:   "#cc1a1b26" // bg at 80% opacity
    readonly property color colBgAlpha60:   "#991a1b26" // bg at 60% opacity
    readonly property color colBgAlpha40:   "#661a1b26" // bg at 40% opacity (popups)
    readonly property color colOverlay:     "#801a1b26" // modal overlay tint
    readonly property color colShadow:      "#8013141f" // drop shadow color

    // workspace / tag styling helpers
    readonly property color colWorkspacePillBg:         colMuted
    readonly property color colWorkspacePillBgAlpha:    Qt.rgba(colMuted.r, colMuted.g, colMuted.b, 0.27)
    readonly property color colWorkspaceInactiveBg:     colMuted
    readonly property color colWorkspaceInactiveFg:     colFg
    readonly property color colWorkspaceActiveBg:       colMagenta
    readonly property color colWorkspaceActiveFg:       colWhite
    readonly property color colWorkspaceHoverBg:        Qt.rgba(colCyan.r, colCyan.g, colCyan.b, 0.18)
    readonly property color colWorkspaceUrgentBg:       colDanger
    readonly property color colWorkspaceUrgentFg:       colWhite

   
    readonly property string fontFamily:    "JetBrains Nerd Font"
    readonly property string fontFamilyMono:"JetBrainsMono Nerd Font"
    readonly property string fontFamilyUI:  "Inter"     // clean UI font fallback
    readonly property string fontVapor:    "VT323" // decorative vaporwave font

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

    // vaporwave sizing helpers
    readonly property int    vaporGlowSize:  24
    readonly property int    vaporBorder:    2
    readonly property int    vaporFloat:     10
    readonly property real   vaporOpacity:   0.85
    readonly property real   vaporGlassOpacity: 0.18

    // crt sizing / tuning helpers
    readonly property int    crtScanlineHeight: 2
    readonly property int    crtGlowSize:      18
    readonly property int    crtBorder:        1
    readonly property int    crtFloat:          4
    readonly property int    crtCurve:          8
    readonly property real   crtOpacity:        0.88
    readonly property real   crtFlickerOpacity: 0.06
    readonly property real   crtScanOpacity:    0.22
    readonly property real   crtNoiseOpacity:   0.04

    readonly property int    radiusNone:    0
    readonly property int    radiusSm:      4
    readonly property int    radius:        6           // default corner radius
    readonly property int    radiusMd:      8
    readonly property int    radiusLg:      12
    readonly property int    radiusPill:    999         // fully rounded / pill shape

    readonly property int    radiusVaporSm:  10
    readonly property int    radiusVapor:    18
    readonly property int    radiusVaporLg:  24
    readonly property int    radiusVaporPill: 999

    readonly property int    radiusCrtSm:    4
    readonly property int    radiusCrt:      8
    readonly property int    radiusCrtLg:    12
    readonly property int    radiusCrtPill:  999

    readonly property int    barHeight:     40
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