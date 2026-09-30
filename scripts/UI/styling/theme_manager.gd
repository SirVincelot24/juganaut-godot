extends Node

signal theme_changed

const LIGHT_THEME = preload("res://themes/generated/light_theme.tres")
const DARK_THEME = preload("res://themes/generated/dark_theme.tres")

var settings_scene = preload("res://scenes/settings_menu.tscn").instantiate()

var is_dark := true

func set_dark_mode(enabled: bool):
	is_dark = enabled
	apply_theme()

func apply_theme():
	var theme = DARK_THEME if is_dark else LIGHT_THEME
	get_tree().root.theme = theme
	for ui_root in get_tree().get_nodes_in_group("themed_ui"):
		ui_root.theme = theme
	theme_changed.emit()

func toggle_theme():
	set_dark_mode(!is_dark)

func _ready() -> void:
	set_dark_mode(true)
	get_tree().current_scene.add_sibling.call_deferred(settings_scene)
	settings_scene.visible = false
