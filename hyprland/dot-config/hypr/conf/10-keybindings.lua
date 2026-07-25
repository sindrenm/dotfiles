-- Keybinding configuration for Hyprland
--
-- See https://wiki.hypr.land/Configuring/Basics/Binds/

local vars = require("conf.00-variables")
local mod = vars.mod

hl.bind(mod .. " + Q", hl.dsp.window.close())
hl.bind(mod .. " + Return", hl.dsp.exec_cmd(vars.terminal))
hl.bind("CTRL + ALT + Delete", hl.dsp.exec_cmd("wleave --no-version-info"))
hl.bind(mod .. " + Escape", hl.dsp.exec_cmd("loginctl lock-session"))
hl.bind(mod .. " + SHIFT + Escape", hl.dsp.exec_cmd("systemctl suspend"))
hl.bind(mod .. " + E", hl.dsp.exec_cmd(vars.fileManager))

-- Move window to/from floating
hl.bind(mod .. " + SHIFT + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mod .. " + F", hl.dsp.exec_cmd("~/.config/hypr/scripts/toggle-float-focus.sh"))
hl.bind(mod .. " + space", hl.dsp.exec_cmd(vars.menu))
hl.bind(mod .. " + W", hl.dsp.exec_cmd("set-wallpaper"))

-- Move focus with mod + [hjkl]
hl.bind(mod .. " + H", hl.dsp.focus({ direction = "l" }))
hl.bind(mod .. " + K", hl.dsp.focus({ direction = "u" }))
hl.bind(mod .. " + L", hl.dsp.focus({ direction = "r" }))
hl.bind(mod .. " + J", hl.dsp.focus({ direction = "d" }))

-- Move focus with mod + shift + [hjkl]
hl.bind(mod .. " + SHIFT + H", hl.dsp.window.move({ direction = "l" }))
hl.bind(mod .. " + SHIFT + K", hl.dsp.window.move({ direction = "u" }))
hl.bind(mod .. " + SHIFT + L", hl.dsp.window.move({ direction = "r" }))
hl.bind(mod .. " + SHIFT + J", hl.dsp.window.move({ direction = "d" }))

-- Resize active window with mod + ctrl + [hjkl]
hl.bind(mod .. " + CTRL + H", hl.dsp.window.resize({ x = -20, y = 0, relative = true }), { repeating = true })
hl.bind(mod .. " + CTRL + J", hl.dsp.window.resize({ x = 0, y = 20, relative = true }), { repeating = true })
hl.bind(mod .. " + CTRL + K", hl.dsp.window.resize({ x = 0, y = -20, relative = true }), { repeating = true })
hl.bind(mod .. " + CTRL + L", hl.dsp.window.resize({ x = 20, y = 0, relative = true }), { repeating = true })

-- Resize active window to predefined configs
hl.bind(mod .. " + equal", hl.dsp.layout("colresize +conf"))
hl.bind(mod .. " + minus", hl.dsp.layout("colresize -conf"))

-- Center the current column
hl.bind(mod .. " + C", hl.dsp.layout("center"))

-- Switch workspaces with mod + [1-9]
for i = 1, 9 do
  hl.bind(mod .. " + " .. i, hl.dsp.focus({ workspace = i }))
end

-- Move active window to a workspace with mod + shift + [1-9]
for i = 1, 9 do
  hl.bind(mod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end

-- Move to and open the special workspace
hl.bind(mod .. " + S", hl.dsp.workspace.toggle_special())
hl.bind(mod .. " + SHIFT + S", hl.dsp.exec_cmd("~/.config/hypr/scripts/toggle-special-workspace.sh"))

-- Screenshots (clipboard only)
hl.bind("Print", hl.dsp.exec_cmd("grimblast copy area --freeze"))
hl.bind("SUPER + Print", hl.dsp.exec_cmd("grimblast copy active --freeze"))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd("grimblast copy output --freeze"))

-- Screenshots (save to disk)
hl.bind("CTRL + Print", hl.dsp.exec_cmd("grimblast save area --freeze"))
hl.bind("CTRL + SUPER + Print", hl.dsp.exec_cmd("grimblast save active --freeze"))
hl.bind("CTRL + SHIFT + Print", hl.dsp.exec_cmd("grimblast save output --freeze"))

-- Move/resize windows with mod + LMB/RMB and dragging
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"),
  { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
  { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
  { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
