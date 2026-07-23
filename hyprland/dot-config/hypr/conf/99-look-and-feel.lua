-- Look and Feel configuration for Hyprland
--
-- See https://wiki.hypr.land/Configuring/Basics/Variables/

local colors = require("conf.themes.catppuccin.latte")

hl.config({
  general = {
    gaps_in = 8,
    gaps_out = 16,

    border_size = 2,

    col = {
      active_border = { colors = { colors.sky, "rgba(" .. colors.pinkAlpha .. "ee)" }, angle = 45 },
      inactive_border = colors.crust,
    },

    layout = "scrolling",
  },

  decoration = {
    rounding = 4,
    rounding_power = 10.0,

    active_opacity = 1.0,
    inactive_opacity = 0.9,

    shadow = {
      enabled = true,
      range = 4,
      render_power = 3,
      color = "rgba(" .. colors.crustAlpha .. "ee)",
    },

    blur = {
      enabled = true,
      size = 10,
      passes = 1,
      vibrancy = 0.1696,
    },
  },
})
