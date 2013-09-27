import XMonad

main = xmonad defaultConfig
    { modMask = mod4Mask
    , borderWidth = 0
    , terminal = "urxvt"
    }
