-- Keyboard and mouse configuration for Hyprland
--
-- See https://wiki.hypr.land/Configuring/Basics/Variables/#input

hl.config({
  input = {
    kb_layout = "us",
    kb_options = "compose:caps",

    follow_mouse = true,

    touchpad = {
      natural_scroll = false,
    },
  },
})

-- See https://wiki.hypr.land/Configuring/Basics/Variables/#gestures

hl.gesture({
  fingers = 3,
  direction = "horizontal",
  action = "workspace",
})
