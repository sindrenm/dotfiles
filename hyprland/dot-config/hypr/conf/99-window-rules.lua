-- Window rules for Hyprland
--
-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/ for more

hl.window_rule({
  name = "Fix some dragging issues with XWayland",

  match = {
    class      = "^$",
    title      = "^$",
    xwayland   = true,
    float      = true,
    fullscreen = false,
    pin        = false,
  },

  no_focus = true,
})

hl.window_rule({
  name = "Ignore maximize requests from apps. You'll probably like this.",

  match = { class = ".*" },

  suppress_event = "maximize",
})

hl.window_rule({
  name = "Float picture-in-picture windows",

  match = { title = "^Picture-in-Picture$" },

  float = true,
  pin = true,
  keep_aspect_ratio = true,
  no_anim = true,
  no_blur = true,
  no_dim = true,
})
