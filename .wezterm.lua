local wezterm = require("wezterm")

local function font_with_fallback(name, params)
	local names = { name, "Mononoki Nerd Font" }
	return wezterm.font_with_fallback(names, params)
end

local font_name = "JetBrainsMono Nerd Font"

return {
	automatically_reload_config = true,
	inactive_pane_hsb = { saturation = 1.0, brightness = 1.0 },
	window_close_confirmation = "NeverPrompt",
	window_frame = { active_titlebar_bg = "#1c252c", font = font_with_fallback(font_name, { bold = true }) },
	front_end = "OpenGL",

	font = font_with_fallback(font_name),
	font_rules = {
		{
			italic = true,
			font = font_with_fallback(font_name, { italic = true }),
		},
		{
			italic = false,
			font = font_with_fallback(font_name, { bold = true }),
		},
		{
			intensity = "Bold",
			font = font_with_fallback(font_name, { bold = true }),
		},
	},
	font_size = 14,
	line_height = 1.0,

	bold_brightens_ansi_colors = true,
	dpi = 96.0,

	window_padding = {
		left = 15,
		right = 15,
		top = 15,
	},
	initial_rows = 999,
	initial_cols = 999,
	scrollback_lines = 5000,

	default_cursor_style = "BlinkingBar",
	warn_about_missing_glyphs = false,
	enable_wayland = true,

	enable_tab_bar = true,
	hide_tab_bar_if_only_one_tab = true,
	show_tab_index_in_tab_bar = true,
	tab_max_width = 28,

	keys = {
		{
			key = "d",
			mods = "CMD",
			action = wezterm.action({
				SplitHorizontal = { domain = "CurrentPaneDomain" },
			}),
		},
		{
			key = "d",
			mods = "CMD|SHIFT",
			action = wezterm.action({
				SplitVertical = { domain = "CurrentPaneDomain" },
			}),
		},
		{
			key = "t",
			mods = "CMD",
			action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }),
		},
		{
			key = "w",
			mods = "CMD",
			action = wezterm.action({ CloseCurrentTab = { confirm = false } }),
		},
		{
			key = "w",
			mods = "CMD|SHIFT",
			action = wezterm.action({ CloseCurrentPane = { confirm = false } }),
		},
		{
			key = "x",
			mods = "CMD",
			action = wezterm.action.ActivateCopyMode,
		},
		{
			key = "v",
			mods = "CMD|SHIFT",
			action = wezterm.action({ PasteFrom = "Clipboard" }),
		},
		{
			key = "c",
			mods = "CMD|SHIFT",
			action = wezterm.action({ CopyTo = "ClipboardAndPrimarySelection" }),
		},
		{
			key = "LeftArrow",
			mods = "OPT",
			action = wezterm.action({ SendString = "\x1bb" }),
		},
		{
			key = "RightArrow",
			mods = "OPT",
			action = wezterm.action({ SendString = "\x1bf" }),
		},
	},

  colors = {
    indexed = {[16] = "#f1cf8a", [17] = "#dee1e6"},

    scrollbar_thumb = "#384148",
    split = "#22262e",

    tab_bar = {
      background = "#22262e",
      active_tab = {
        bg_color = "#70a5eb",
	      fg_color = "#b6beca"
      },
      inactive_tab = {
	      bg_color = "#22262e",
	      fg_color = "#b6beca"
	    },
      inactive_tab_hover = {
	      bg_color = "#384148",
	      fg_color = "#b6beca"
	    },
	    new_tab = {
	      bg_color = "#22262e",
	      fg_color = "#b6beca"
	    },
	    new_tab_hover = {
	      bg_color = "#384148",
	      fg_color = "#b6beca",
	      italic = true
	    },
    },

    visual_bell = "#384148",

    -- nightbuild only
    compose_cursor = "#f1cf8a",

    -- Theme Colors (Decay)
    foreground = "#b6beca",
    background = "#101419",
    cursor_bg = "#dee1e6",
    cursor_border = "#b6beca",
    cursor_fg = "#22262e",
    selection_bg = "#575268",
    selection_fg = "#D9E0EE",

    ansi = {"#1c252c", "#e05f65", "#78dba9", "#f1cf8a", "#70a5eb", "#c68aee","#74bee9", "#dee1e6"},
    brights = {"#384148", "#fc7b81", "#94f7c5", "#ffeba6", "#8cc1ff", "#e2a6ff", "#90daff", "#b6beca"},
  }
}
