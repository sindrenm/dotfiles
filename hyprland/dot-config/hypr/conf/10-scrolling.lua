-- Hyprland config for the Scrolling layout model
--
-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/

hl.config({
  scrolling = {
    column_width = 0.5,
    fullscreen_on_one_column = false,
    explicit_column_widths = "0.333, 0.55, 0.667, 1.0",
    wrap_swapcol = true,
    direction = "right",
    follow_focus = true,
  },
})
