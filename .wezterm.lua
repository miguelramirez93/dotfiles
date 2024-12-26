local wezterm = require("wezterm")
local config = {}

config.color_scheme = "nightfox"

config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
config.font_size = 13
config.line_height = 1.2

config.tab_bar_at_bottom = false
config.hide_tab_bar_if_only_one_tab = true

return config
