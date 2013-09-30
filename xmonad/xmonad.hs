import XMonad
import qualified Data.Map as M
import Graphics.X11.Xlib
import XMonad.Util.EZConfig
import XMonad.Util.Run

main = xmonad defaultConfig
    { modMask = mod4Mask
    , borderWidth = 0
    , terminal = "urxvt"
    }

newKeys x = M.union (keys defaultConfig x) (mkKeymap x myKeys)
myKeys = [
  ("<XF86AudioLowerVolume>", spawn "amixer sset -- Master playback 10-"),
  ("<XF86AudioRaiseVolume>", spawn "amixer sset -- Master playback 10+"),
  ("S-<XF86AudioRaiseVolume>", spawn "amixer sset -- Master playback 100%"),
  ("<XF86AudioMute>", spawn "amixer sset -- Master playback 0%")
  ]
