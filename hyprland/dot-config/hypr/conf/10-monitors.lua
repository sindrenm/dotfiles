-- Monitor configuration for Hyprland
--
-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

hl.monitor({
  output = "",
  mode = "preferred",
  position = "auto",
  scale = "auto",
})

-- Shared spec for the laptop panel; lid binds below only override `disabled`.
local laptopMonitor = {
  output = "eDP-1",
  mode = "preferred",
  position = "auto",
  scale = "auto",
}

-- Turn laptop monitor off when its lid is closed
hl.bind("switch:on:Lid Switch", function()
  laptopMonitor.disabled = true;
  hl.monitor(laptopMonitor)
end)

-- Turn laptop monitor on when its lid is opened
hl.bind("switch:off:Lid Switch", function()
  laptopMonitor.disabled = false;
  hl.monitor(laptopMonitor)
end)
