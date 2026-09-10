@tool
extends ProgrammaticTheme

var LIGHT_THEME = load("res://scripts/UI/light_theme.gd").new()
var DARK_THEME = load("res://scripts/UI/dark_theme.gd").new()

var default_font_size = 30
var color_scheme: ColorScheme

func setup_dark_theme():
	set_save_path("res://themes/generated/dark_theme.tres")
	color_scheme = DARK_THEME.theme
func setup_light_theme():
	set_save_path("res://themes/generated/light_theme.tres")
	color_scheme = LIGHT_THEME.theme

func define_theme():
	var normalButtonBg = stylebox_flat({
			bg_color = color_scheme.primaryContainer,
			corner_ = corner_radius(5)
		})
	var startButtonBg = inherit(normalButtonBg, {
			bg_color = color_scheme.primaryContainer,
			border_color = color_scheme.onPrimaryContainer,
			border_ = border_width(5)
		})
	var settingsButtonBg = inherit(normalButtonBg, {
			bg_color = color_scheme.tertiaryContainer
		})
	var quitButtonBg = inherit(normalButtonBg, {
			bg_color = color_scheme.errorContainer
		})
	
	define_default_font_size(default_font_size)
	define_style("Button", {
		font_color = color_scheme.error,
		normal = normalButtonBg,
		hover = normalButtonBg
	})
	define_variant_style("StartButton", "Button", {
		font_color = color_scheme.onPrimaryContainer,
		normal = startButtonBg,
		hover = startButtonBg
	})
	define_variant_style("SettingsButton", "Button", {
		font_color = color_scheme.onTertiaryContainer,
		normal = settingsButtonBg,
		hover = settingsButtonBg
	})
	define_variant_style("QuitButton", "Button", {
		font_color = color_scheme.onErrorContainer,
		normal = quitButtonBg,
		hover = quitButtonBg
	})
	define_style("Panel", {
		panel = stylebox_flat({
			bg_color = color_scheme.surfaceContainer
		})
	})
