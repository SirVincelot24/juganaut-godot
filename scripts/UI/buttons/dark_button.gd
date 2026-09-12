extends CheckButton

func _toggled(_toggled_on: bool) -> void:
	ThemeManager.toggle_theme()
