-- Miscellaneous Hyprland configuration
--
-- See https://wiki.hypr.land/Configuring/Basics/Variables/#misc

hl.config({
  misc = {
    -- Have Hyprland swallow Kitty whenever a GUI app is opened from it
    enable_swallow = true,
    swallow_regex = "^(kitty)$",

    focus_on_activate = true,
    middle_click_paste = false,
  },
})
