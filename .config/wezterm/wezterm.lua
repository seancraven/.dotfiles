-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.font_size = 16
config.font = wezterm.font("Fira Code", { weight = "DemiBold" })
config.color_scheme = "tokyonight-storm"
config.window_background_opacity = 0.6

-- and finally, return the configuration to wezterm
return config
