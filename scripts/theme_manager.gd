extends Node

signal theme_changed

const LIGHT_THEME = preload("res://themes/light_theme.gd")
const DARK_THEME = preload("res://themes/dark_theme.gd")
const MAIN_THEME = preload("res://themes/mainTheme.tres")

var is_dark := true
var theme: ColorScheme = DARK_THEME.theme

func set_dark_mode(enabled: bool):
	is_dark = enabled
	theme = DARK_THEME.theme if is_dark else LIGHT_THEME.theme
	test()
	theme_changed.emit()

func toggle_theme():
	set_dark_mode(!is_dark)

func _ready() -> void:
	set_dark_mode(true)

func test():
	MAIN_THEME.set_color("font_color", "SettingsButton", theme.onTertiaryContainer)
	MAIN_THEME.set_stylebox("normal", "Button", StyleBoxFlat.new())
	
	
	
	
	
	
