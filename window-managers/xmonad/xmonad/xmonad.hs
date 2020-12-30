import System.Exit
import System.IO

import XMonad

import XMonad.Actions.CycleWS
import XMonad.Actions.SpawnOn

import XMonad.Config.Azerty
import XMonad.Config.Desktop

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers(doFullFloat, doCenterFloat, isFullscreen, isDialog)
import XMonad.Hooks.SetWMName
import XMonad.Hooks.UrgencyHook

import XMonad.Layout.CenteredMaster(centerMaster)
import XMonad.Layout.Cross(simpleCross)
import XMonad.Layout.Fullscreen (fullscreenFull)
import XMonad.Layout.Gaps
import XMonad.Layout.IndependentScreens
import XMonad.Layout.MultiToggle
import XMonad.Layout.MultiToggle.Instances
import XMonad.Layout.ResizableTile
import XMonad.Layout.Spacing
import XMonad.Layout.Spiral(spiral)
import XMonad.Layout.ThreeColumns

import XMonad.Util.EZConfig (additionalKeys, additionalMouseBindings)
import XMonad.Util.NamedWindows (getName)
import XMonad.Util.Run(safeSpawn, spawnPipe)

import Control.Monad (forM_, join, liftM2)

import Data.List (sortBy)
import Data.Function (on)

import Graphics.X11.ExtraTypes.XF86

import qualified Codec.Binary.UTF8.String as UTF8
import qualified DBus as D
import qualified DBus.Client as D
import qualified Data.ByteString as B
import qualified Data.Map as M
import qualified XMonad.StackSet as W

-- Startup
myStartupHook = do
    spawn "$HOME/.xmonad/scripts/autostart.sh"
    setWMName "LG3D"

-- Colours
myNormalBorderColor = "#4C566A"
myFocusedBorderColor = "#5E81AC"

encodeCChar = map fromIntegral . B.unpack

-- Modifier keys:
--   mod4Mask = super key
--   mod1Mask = alt key
--   controlMask = ctrl key
--   shiftMask = shift key

myModMask = mod4Mask
myFocusFollowsMouse = False
myBorderWidth = 2
myWorkspaces =
  [ "CODE"
  , "WWW"
  , "FILES"
  , "CHAT"
  , "MEDIA" ]

myBaseConfig = desktopConfig

-- Window manipulations

myManageHook = composeAll . concat $
  [ [isDialog --> doCenterFloat]
  , [className =? c --> doCenterFloat | c <- classes]
  , [title =? t --> doFloat | t <- titles]
  , [resource =? r --> doFloat | r <- resources]
  , [resource =? i --> doIgnore | i <- ignores]
  ]

  where

    classes =
      [ "Arandr"
      , "Arcolinux-tweak-tool.py"
      , "Arcolinux-welcome-app.py"
      , "Galculator" ]

    titles =
      [ "Downloads"
      , "Save As..." ]

    resources = []

    ignores = ["desktop_window"]

myLayout = spacingRaw True (Border 0 5 5 5) True (Border 5 5 5 5) True $
  avoidStruts $
  mkToggle (NBFULL ?? NOBORDERS ?? EOT) $
  tiled ||| Mirror tiled ||| spiral (6 / 7)  ||| ThreeColMid 1 (3 / 100) (1 / 2) ||| Full

    where

      tiled = Tall nmaster delta tiled_ratio
      nmaster = 1
      delta = 3 / 100
      tiled_ratio = 1 / 2

myMouseBindings (XConfig {XMonad.modMask = modMask}) = M.fromList $
    -- Set the window to floating mode and move by dragging
    [ ((modMask, 1), (\w -> focus w >> mouseMoveWindow w >> windows W.shiftMaster))

    -- Raise the window to the top of the stack
    , ((modMask, 2), (\w -> focus w >> windows W.shiftMaster))

    -- Set the window to floating mode and resize by dragging
    , ((modMask, 3), (\w -> focus w >> mouseResizeWindow w >> windows W.shiftMaster)) ]

-- Key config

myKeys conf @ (XConfig {XMonad.modMask = modMask}) = M.fromList $
  -- SUPER KEYS

  [ ((modMask, xK_f), sendMessage $ Toggle NBFULL)
  , ((modMask, xK_q), kill)
  , ((modMask, xK_v), spawn $ "pavucontrol")
  , ((modMask, xK_Escape), spawn $ "arcolinux-logout")
  , ((modMask, xK_Return), spawn $ "alacritty")
  , ((modMask, xK_w), spawn $ "firefox")

  -- SUPER + ALT KEYS

  , ((modMask .|. mod1Mask , xK_Return), spawn $ "rofi -show run")

  -- SUPER + SHIFT KEYS

  , ((modMask .|. shiftMask , xK_Return), spawn $ "thunar")
  , ((modMask .|. shiftMask , xK_r), spawn $ "xmonad --recompile && xmonad --restart")

  -- CONTROL + SHIFT KEYS

  , ((controlMask .|. shiftMask , xK_Escape), spawn $ "xfce4-taskmanager")

  --SCREENSHOTS

  , ((0, xK_Print), spawn $ "scrot 'Screenshot_%Y-%m-%d-%s.jpg' -e 'mv $f $$(xdg-user-dir PICTURES)'")
  , ((modMask, xK_Print), spawn $ "xfce4-screenshooter")

  -- MULTIMEDIA KEYS

  -- Mute volume
  , ((0, xF86XK_AudioMute), spawn $ "amixer -q set Master toggle")

  -- Decrease volume
  , ((0, xF86XK_AudioLowerVolume), spawn $ "amixer -q set Master 5%-")

  -- Increase volume
  , ((0, xF86XK_AudioRaiseVolume), spawn $ "amixer -q set Master 5%+")

  -- Increase brightness
  , ((0, xF86XK_MonBrightnessUp),  spawn $ "xbacklight -inc 5")

  -- Decrease brightness
  , ((0, xF86XK_MonBrightnessDown), spawn $ "xbacklight -dec 5")

  -- Play/pause current track
  , ((0, xF86XK_AudioPlay), spawn $ "playerctl play-pause")

  -- Play next track
  , ((0, xF86XK_AudioNext), spawn $ "playerctl next")

  -- Play previous track
  , ((0, xF86XK_AudioPrev), spawn $ "playerctl previous")

  -- Stop current track
  , ((0, xF86XK_AudioStop), spawn $ "playerctl stop")

  --  XMONAD LAYOUT KEYS

  -- Cycle through the available layout algorithms
  , ((modMask, xK_space), sendMessage NextLayout)

  -- Focus selected desktop
  , ((modMask, xK_Tab), nextWS)

  -- Reset the layouts on the current workspace to default
  , ((modMask .|. shiftMask, xK_space), setLayout $ XMonad.layoutHook conf)

  -- Move focus to the next window
  , ((modMask, xK_j), windows W.focusDown)

  -- Move focus to the previous window
  , ((modMask, xK_k), windows W.focusUp)

  -- Move focus to the master window
  , ((modMask .|. shiftMask, xK_m), windows W.focusMaster)

  -- Swap the focused window with the next window
  , ((modMask .|. shiftMask, xK_j), windows W.swapDown)

  -- Swap the focused window with the previous window
  , ((modMask .|. shiftMask, xK_k), windows W.swapUp)

  -- Shrink the master area
  , ((modMask .|. shiftMask , xK_h), sendMessage Shrink)

  -- Expand the master area
  , ((modMask .|. shiftMask , xK_l), sendMessage Expand)

  -- Push window back into tiling
  , ((modMask .|. shiftMask , xK_t), withFocused $ windows . W.sink)

  -- Increment the number of windows in the master area
  , ((modMask .|. shiftMask, xK_Left), sendMessage (IncMasterN 1))

  -- Decrement the number of windows in the master area.
  , ((modMask .|. shiftMask, xK_Right), sendMessage (IncMasterN (-1)))
  ]

  ++

  -- mod-[1..5], Switch to workspace N
  -- mod-shift-[1..5], Move client to workspace N
  [ ((m .|. modMask, k), windows $ f i)
  | (i, k) <- zip (XMonad.workspaces conf) [xK_1, xK_2, xK_3, xK_4, xK_5]
  , (f, m) <- [ (W.greedyView, 0), (W.shift, shiftMask)
              , (\i -> W.greedyView i . W.shift i, shiftMask)] ]

myLogFileWindowTitle = "/tmp/.xmonad-title-log"

eventLogHook = do
  winset <- gets windowset
  title <- maybe (return "") (fmap show . getName) . W.peek $ winset

  io $ appendFile myLogFileWindowTitle (title ++ "\n")

main :: IO ()
main = do
  -- Create log files (named pipes) for Polybar to consume (populated in eventLogHook)
  spawn $ "mkfifo " ++ myLogFileWindowTitle

  -- Request access to the DBus name
  dbus <- D.connectSession

  D.requestName dbus (D.busName_ "org.xmonad.Log")
    [ D.nameAllowReplacement
    , D.nameReplaceExisting
    , D.nameDoNotQueue ]

  xmonad . ewmh $
    myBaseConfig

    { startupHook = myStartupHook
    , layoutHook = gaps [(U,35), (D,5), (R,5), (L,5)] $ myLayout ||| layoutHook myBaseConfig
    , manageHook = manageSpawn <+> myManageHook <+> manageHook myBaseConfig
    , logHook = eventLogHook
    , modMask = myModMask
    , borderWidth = myBorderWidth
    , handleEventHook    = handleEventHook myBaseConfig <+> fullscreenEventHook
    , focusFollowsMouse = myFocusFollowsMouse
    , workspaces = myWorkspaces
    , focusedBorderColor = myFocusedBorderColor
    , normalBorderColor = myNormalBorderColor
    , keys = myKeys
    , mouseBindings = myMouseBindings }
