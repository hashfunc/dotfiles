local wezterm = require 'wezterm'

local settings = {
    color_scheme = {
        name = "Ef-Day",
        config = wezterm.color.get_builtin_schemes()["Ef-Day"]
    }
}

local config = {
    color_scheme = settings.color_scheme.name,
    window_background_opacity = 0.95,
    colors = {
        tab_bar = {
            background = settings.color_scheme.config.background,
            active_tab = {
                bg_color = settings.color_scheme.config.background,
                fg_color = settings.color_scheme.config.foreground
            },
            inactive_tab = {
                bg_color = settings.color_scheme.config.background,
                fg_color = settings.color_scheme.config.foreground
            },
            inactive_tab_hover = {
                bg_color = settings.color_scheme.config.background,
                fg_color = settings.color_scheme.config.foreground
            },
            inactive_tab_edge = settings.color_scheme.config.background,
            new_tab = {
                bg_color = settings.color_scheme.config.foreground,
                fg_color = settings.color_scheme.config.background
            },
            new_tab_hover = {
                bg_color = settings.color_scheme.config.foreground,
                fg_color = settings.color_scheme.config.background
            }
        }
    },
    window_frame = {
        active_titlebar_bg = settings.color_scheme.config.foreground,
        inactive_titlebar_bg = settings.color_scheme.config.background
    }
}

return config
