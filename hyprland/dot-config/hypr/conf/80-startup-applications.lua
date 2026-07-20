-- Start-up applications for Hyprland
--
-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

hl.on("hyprland.start", function()
  hl.exec_cmd("uwsm app -- ashell")
  hl.exec_cmd("uwsm app -- awww-daemon")
  hl.exec_cmd("systemctl --user start hyprpolkitagent")
  hl.exec_cmd("systemctl --user start vicinae.service")
end)
