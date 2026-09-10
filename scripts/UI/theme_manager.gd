extends Node

signal theme_changed

const LIGHT_THEME = preload("res://themes/generated/light_theme.tres")
const DARK_THEME = preload("res://themes/generated/dark_theme.tres")

var is_dark := true

func set_dark_mode(enabled: bool):
	is_dark = enabled
	var theme = DARK_THEME if is_dark else LIGHT_THEME
	get_tree().root.theme = theme
	theme_changed.emit()

func toggle_theme():
	set_dark_mode(!is_dark)

func _ready() -> void:
	set_dark_mode(true)
