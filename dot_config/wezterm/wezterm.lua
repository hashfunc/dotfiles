local wezterm = require("wezterm")

local settings = (function()
	local color_scheme = {
		name = "Ef-Day",
	}
	color_scheme.config = wezterm.color.get_builtin_schemes()[color_scheme.name]

	return {
		color_scheme = color_scheme,
	}
end)()

return {
	color_scheme = settings.color_scheme.name,
	colors = {
		tab_bar = {
			background = settings.color_scheme.config.background,
			active_tab = {
				bg_color = settings.color_scheme.config.background,
				fg_color = settings.color_scheme.config.foreground,
			},
			inactive_tab = {
				bg_color = settings.color_scheme.config.background,
				fg_color = settings.color_scheme.config.foreground,
			},
			inactive_tab_hover = {
				bg_color = settings.color_scheme.config.background,
				fg_color = settings.color_scheme.config.foreground,
			},
			inactive_tab_edge = settings.color_scheme.config.background,
			new_tab = {
				bg_color = settings.color_scheme.config.foreground,
				fg_color = settings.color_scheme.config.background,
			},
			new_tab_hover = {
				bg_color = settings.color_scheme.config.foreground,
				fg_color = settings.color_scheme.config.background,
			},
		},
	},

	window_background_opacity = 0.85,
	window_frame = {
		active_titlebar_bg = settings.color_scheme.config.foreground,
		inactive_titlebar_bg = settings.color_scheme.config.background,
	},

	use_fancy_tab_bar = false,
	tab_bar_at_bottom = true,
	show_new_tab_button_in_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
}
