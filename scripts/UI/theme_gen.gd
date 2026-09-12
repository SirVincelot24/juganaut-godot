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
			corner_ = corner_radius(10),
			content_margins_ = content_margins(10, 5, 10, 5)
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
		}),
		optionButton = inherit(normalButtonBg, {
			bg_color = Color.TRANSPARENT,
			border_ = border_width(2),
			border_color = color_scheme.outline
		}),
	}
	var almostTransparent = stylebox_flat({
			bg_color = Color(color_scheme.onBackground, 0.1)
		})
	var optionButtonPressed = inherit(buttonBgVariations["optionButton"], {
		border_color = color_scheme.primary,
		border_ = border_width(4)
	})
	
	var button_pressed = {}
	for entry in buttonBgVariations.keys():
		button_pressed[entry] = inherit(buttonBgVariations[entry], {
			bg_color = Color(buttonBgVariations[entry].bg_color, 0.9)
		})
	
	define_default_font_size(default_font_size)
	
	# Buttons
	define_style("Button", {
		font_color = color_scheme.onSurface,
		font_pressed_color = color_scheme.onSurface,
		font_hover_color = color_scheme.onSurfaceVariant,
		font_hover_pressed_color = color_scheme.onSurfaceVariant,
		normal = normalButtonBg,
		hover = normalButtonBg,
		pressed = normalButtonBg,
		hover_pressed = normalButtonBg
	})
	define_variant_style("StartButton", "Button", {
		font_color = color_scheme.onPrimaryContainer,
		font_pressed_color = color_scheme.onPrimaryContainer,
		normal = buttonBgVariations["startButtonBg"],
		hover = buttonBgVariations["startButtonBg"],
		pressed = button_pressed["startButtonBg"]
	})
	define_variant_style("SettingsButton", "Button", {
		font_color = color_scheme.onTertiaryContainer,
		font_pressed_color = color_scheme.onTertiaryContainer,
		normal = buttonBgVariations["settingsButtonBg"],
		hover = buttonBgVariations["settingsButtonBg"],
		pressed = button_pressed["settingsButtonBg"]
	})
	define_variant_style("QuitButton", "Button", {
		font_color = color_scheme.onErrorContainer,
		font_presssed_color = color_scheme.onErrorContainer,
		normal = buttonBgVariations["quitButtonBg"],
		hover = buttonBgVariations["quitButtonBg"],
		pressed = button_pressed["quitButtonBg"]
	})
	define_variant_style("StopButton", "Button", {
		font_color = color_scheme.onSecondary,
		font_pressed_color = color_scheme.onSecondary,
		normal = buttonBgVariations["stopButtonBg"],
		hover = buttonBgVariations["stopButtonBg"],
		pressed = button_pressed["stopButtonBg"]
	})
	define_style("CheckButton", {
		font_color = color_scheme.onBackground,
		font_pressed_color = color_scheme.onBackground,
		normal = stylebox_empty({}),
		hover = stylebox_empty({}),
		pressed = stylebox_empty({}),
		hover_pressed = stylebox_empty({}),
		button_checked_color = color_scheme.primary,
		button_unchecked_color = color_scheme.surfaceContainerHighest
	})
	define_style("OptionButton", {
		font_color = color_scheme.onSurface,
		font_pressed_color = color_scheme.onSurface,
		normal = buttonBgVariations["optionButton"],
		hover = inherit(buttonBgVariations["optionButton"], almostTransparent),
		pressed = optionButtonPressed,
		hover_pressed = inherit(optionButtonPressed, almostTransparent)
	})
	
	# Containers
	define_style("Panel", {
		panel = stylebox_flat({
			bg_color = color_scheme.surfaceContainer
		})
	})
	define_variant_style("TitleBar", "PanelContainer", {
		panel = stylebox_flat({
			bg_color = color_scheme.primary
		})
	})
	define_style("ScrollContainer", {
		panel = stylebox_empty({
			content_margins_ = content_margins(20, -1, 5, -1)
		})
	})
	define_style("PopupMenu", {
		font_color = color_scheme.onSurfaceVariant,
		font_hover_color = color_scheme.onTertiaryContainer,
		font_separator_color = color_scheme.onSurfaceVariant,
		panel = inherit(normalButtonBg, {
			bg_color = color_scheme.surfaceContainerLow,
			border_ = border_width(1),
			border_color = color_scheme.outline
		}),
		hover = inherit(normalButtonBg, {
			bg_color = color_scheme.tertiaryContainer
		})
	})
	
	# Labels
	define_variant_style("TitleLabel", "Label", {
		font_color = Color(1, 0, 0.5)
	})
	define_variant_style("onPrimary", "Label", {
		font_color = color_scheme.onPrimary
	})
	define_variant_style("SettingsHeadline", "Label", {
		font_color = color_scheme.onTertiaryContainer,
		normal = stylebox_empty({
			content_margins_ = content_margins(-1, 50, -1, 20)
		})
	})
