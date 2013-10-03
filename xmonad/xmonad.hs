import XMonad
import qualified Data.Map as M
import Graphics.X11.Xlib
import XMonad.Util.EZConfig(additionalKeys, mkKeymap)
import XMonad.Util.Run
import System.IO

xF86AudioRaiseVolume,xF86AudioLowerVolume, xF86AudioMute :: KeySym
xF86AudioRaiseVolume = 0x1008ff13
xF86AudioLowerVolume = 0x1008ff11
xF86AudioMute = 0x1008ff12

main = do
    xmonad $ defaultConfig
        { modMask = mod4Mask
        , borderWidth = 0
        , terminal = "urxvt"
        } `additionalKeys`
        [ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock")
        , ((0, xF86AudioLowerVolume), spawn "amixer set Master playback 2.5dB- -q")
        , ((0, xF86AudioRaiseVolume), spawn "amixer set Master playback 2.5dB+ -q")
        , ((shiftMask, xF86AudioLowerVolume), spawn "amixer set Master playback 10dB- -q")
        , ((shiftMask, xF86AudioRaiseVolume), spawn "amixer set Master playback 10dB+ -q")
        , ((0, xF86AudioMute), spawn "amixer set Master playback 0% -q")
        ]
