import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

myTerminal   = "urxvt"
myModMask    = mod4Mask
myWorkspaces = ["term", "www", "irc"]

myStatusBar = "dzen2 -bg '#1a1a1a' -fg '#777777' -h 16 -w 550 -sa c -e '' -fn '-*-terminus-*-r-normal-*-*-120-*-*-*-*-iso8859-*' -ta l"
 
defaults = defaultConfig {
    terminal        = myTerminal,
    modMask         = myModMask,
    workspaces      = myWorkspaces
}

main = do
    xmobar <- spawnPipe "xmobar"
    xmonad $ defaults {
        manageHook = manageDocks <+> manageHook defaultConfig,
        layoutHook = avoidStruts $ layoutHook defaultConfig,

        logHook = dynamicLogWithPP $ xmobarPP {
            ppOutput = hPutStrLn xmobar,
            ppTitle = xmobarColor "#ffb6b0" "" . shorten 50,
            ppCurrent = xmobarColor "#ceffac" ""
        }

    }
