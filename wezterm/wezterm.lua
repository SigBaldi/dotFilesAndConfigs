-- Pull in the wezterm API and actions.
local wezterm = require("wezterm")
local act = wezterm.action

-- Pull in my wezterm config folder
local xdg_config_home = os.getenv("XDG_CONFIG_HOME")
local wezterm_config_dir = xdg_config_home .. "/wezterm"

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.color_scheme = "Tomorrow Night Blue (Gogh)"
config.enable_scroll_bar = true
config.keys = {
	-- Clears the scrollback and viewport, and then sends CTRL-L to ask the
	-- shell to redraw its prompt
	{
		key = "k",
		mods = "CMD",
		action = act.Multiple({
			act.ClearScrollback("ScrollbackAndViewport"),
			act.SendKey({ key = "L", mods = "CTRL" }),
		}),
	},
	-- Splits the current pane in half vertically such that the current pane
	-- becomes the top half and the new bottom half spawns a new command
	{
		key = "|",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.SplitVertical({ domain = "currentPaneDomain" }),
	},
}
-- How many lines of scrollback you want to retain per tab
config.scrollback_lines = 100000

-- Wallpaper image
config.window_background_image = xdg_config_home .. "wallpapers/animated-tech.gif"
config.window_background_image_hsb = {
	-- Darken the background image by reducing it to 1/3rd
	brightness = 0.3,

	-- You can adjust the hue by scaling its value.
	-- a multiplier of 1.0 leaves the value unchanged.
	--  hue = 1.0,

	-- You can adjust the saturation also.
	-- saturation = 1.0,
}

-- Log configuration
wezterm.log_info("Loading configuration")
wezterm.log_info(config)

-- and finally, return the configuration to wezterm
return config
