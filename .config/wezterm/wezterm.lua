-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.font_size = 18
config.font = wezterm.font("Agave Nerd Font", { weight = "DemiBold" })
config.color_scheme = "tokyonight-storm"
config.window_background_opacity = 0.9

-- and finally, return the configuration to wezterm
return config
