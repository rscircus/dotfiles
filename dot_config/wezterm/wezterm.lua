local wezterm = require("wezterm")

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config = {
	-- color_scheme = 'terminal.sexy',
	color_scheme = "Catppuccin Mocha",

	-- Tab bar
	enable_tab_bar = true,
	hide_tab_bar_if_only_one_tab = false,
	-- tab_bar_at_bottom = true,
	use_fancy_tab_bar = false,
	tab_and_split_indices_are_zero_based = true,

	-- Appearance
	enable_kitty_graphics = true,
	font_size = 16.0,
	-- font = wezterm.font("Mononoki Nerd Font"),
	font = wezterm.font("JetBrains Mono"),
	-- font = wezterm.font(
	-- 	"BerkeleyMono Nerd Font Mono Plus Font Awesome Plus Font Awesome Extension Plus Octicons Plus Power Symbols Plus Codicons Plus Pomicons Plus Font Logos Plus Material Design Icons Plus Weather Icons"
	-- ),
	-- macos_window_background_blur = 40,
	macos_window_background_blur = 30,

	-- window_background_image = '/Users/r/Downloads/3840x1080-Wallpaper-041.jpg',
	-- window_background_image_hsb = {
	-- 	brightness = 0.01,
	-- 	hue = 1.0,
	-- 	saturation = 0.5,
	-- },
	-- window_background_opacity = 0.92,
	window_background_opacity = 1.0,
	-- window_background_opacity = 0.78,
	-- window_background_opacity = 0.20,
	window_decorations = "RESIZE",
	window_padding = {
		left = 2,
		right = 2,
		top = 1,
		bottom = 1,
	},
	adjust_window_size_when_changing_font_size = false,

	-- Keybindings
	leader = { key = "q", mods = "CTRL", timeout_milliseconds = 2000 },
	keys = {
		{
			mods = "LEADER",
			key = "c",
			action = wezterm.action.SpawnTab("CurrentPaneDomain"),
		},
		{
			mods = "LEADER",
			key = "x",
			action = wezterm.action.CloseCurrentPane({ confirm = true }),
		},
		{
			mods = "LEADER",
			key = "b",
			action = wezterm.action.ActivateTabRelative(-1),
		},
		{
			mods = "LEADER",
			key = "n",
			action = wezterm.action.ActivateTabRelative(1),
		},
		{
			mods = "LEADER",
			key = "v",
			action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{
			mods = "LEADER",
			key = "s",
			action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{
			mods = "LEADER",
			key = "h",
			action = wezterm.action.ActivatePaneDirection("Left"),
		},
		{
			mods = "LEADER",
			key = "j",
			action = wezterm.action.ActivatePaneDirection("Down"),
		},
		{
			mods = "LEADER",
			key = "k",
			action = wezterm.action.ActivatePaneDirection("Up"),
		},
		{
			mods = "LEADER",
			key = "l",
			action = wezterm.action.ActivatePaneDirection("Right"),
		},
		{
			mods = "LEADER",
			key = "LeftArrow",
			action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
		},
		{
			mods = "LEADER",
			key = "RightArrow",
			action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
		},
		{
			mods = "LEADER",
			key = "DownArrow",
			action = wezterm.action.AdjustPaneSize({ "Down", 5 }),
		},
		{
			mods = "LEADER",
			key = "UpArrow",
			action = wezterm.action.AdjustPaneSize({ "Up", 5 }),
		},
	},
	mouse_bindings = {
		-- Ctrl-click will open the link under the mouse cursor
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "CTRL",
			action = wezterm.action.OpenLinkAtMouseCursor,
		},
	},
}

-- Create multiple keys to activate tabs directly
for i = 0, 9 do
	-- leader + number to activate that tab
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = wezterm.action.ActivateTab(i),
	})
end

-- tmux status
wezterm.on("update-right-status", function(window, _)
	local SOLID_LEFT_ARROW = ""
	local ARROW_FOREGROUND = { Foreground = { Color = "#c6a0f6" } }
	local prefix = ""

	if window:leader_is_active() then
		prefix = " " .. utf8.char(0x1f30a) -- ocean wave
		SOLID_LEFT_ARROW = utf8.char(0xe0b2)
	end

	if window:active_tab():tab_id() ~= 0 then
		ARROW_FOREGROUND = { Foreground = { Color = "#1e2030" } }
	end -- arrow color based on if tab is first pane

	window:set_left_status(wezterm.format({
		{ Background = { Color = "#b7bdf8" } },
		{ Text = prefix },
		ARROW_FOREGROUND,
		{ Text = SOLID_LEFT_ARROW },
	}))
end)

return config
