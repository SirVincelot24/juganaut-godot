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
	var buttonBgVariations = {
		startButtonBg = inherit(normalButtonBg, {
			bg_color = color_scheme.primaryContainer,
			border_color = color_scheme.onPrimaryContainer,
			border_ = border_width(5)
			}),
		settingsButtonBg = inherit(normalButtonBg, {
			bg_color = color_scheme.tertiaryContainer
		}),
		quitButtonBg = inherit(normalButtonBg, {
			bg_color = color_scheme.errorContainer
		}),
		stopButtonBg = inherit(normalButtonBg, {
			bg_color = color_scheme.secondary
		})
	}
	var button_pressed = {}
	for entry in buttonBgVariations.keys():
		button_pressed[entry] = inherit(buttonBgVariations[entry], {
			bg_color = Color(buttonBgVariations[entry].bg_color, 0.9)
		})
	
	define_default_font_size(default_font_size)
	define_style("Button", {
		font_color = color_scheme.error,
		normal = normalButtonBg,
		hover = normalButtonBg
	})
	define_variant_style("StartButton", "Button", {
		font_color = color_scheme.onPrimaryContainer,
		normal = buttonBgVariations["startButtonBg"],
		hover = buttonBgVariations["startButtonBg"],
		pressed = button_pressed["startButtonBg"]
	})
	define_variant_style("SettingsButton", "Button", {
		font_color = color_scheme.onTertiaryContainer,
		normal = buttonBgVariations["settingsButtonBg"],
		hover = buttonBgVariations["settingsButtonBg"],
		pressed = button_pressed["settingsButtonBg"]
	})
	define_variant_style("QuitButton", "Button", {
		font_color = color_scheme.onErrorContainer,
		normal = buttonBgVariations["quitButtonBg"],
		hover = buttonBgVariations["quitButtonBg"],
		pressed = button_pressed["quitButtonBg"]
	})
	define_variant_style("StopButton", "Button", {
		font_color = color_scheme.onSecondary,
		normal = buttonBgVariations["stopButtonBg"],
		hover = buttonBgVariations["stopButtonBg"],
		pressed = button_pressed["stopButtonBg"]
	})
	
	define_style("Panel", {
		panel = stylebox_flat({
			bg_color = color_scheme.surfaceContainer
		})
	})
