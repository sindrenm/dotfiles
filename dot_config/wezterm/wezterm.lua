local wezterm = require 'wezterm'

local config = {
  color_scheme = 'JetBrains Darcula',
  font = wezterm.font('JetBrains Mono'),

  enable_tab_bar = false,

  initial_cols = 150,
  initial_rows = 40,

  window_decorations = "NONE",

  window_frame = {
    border_left_width = '2px',
    border_right_width = '2px',
    border_bottom_height = '2px',
    border_top_height = '2px',
    border_left_color = 'white',
    border_right_color = 'white',
    border_bottom_color = 'white',
    border_top_color = 'white',
  },

  window_padding = {
    left = "12px",
    top = "8px",
    right = "12px",
    bottom = "8px",
  },
}


return config
