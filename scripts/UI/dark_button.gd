extends CheckButton

func _toggled(toggled_on: bool) -> void:
	ThemeManager.toggle_theme()
