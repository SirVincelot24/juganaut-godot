extends CheckButton

func _toggled(toggled_on: bool) -> void:
	ThemeManager.set_dark_mode(toggled_on)
	PlayerPrefs.set_pref("dark_mode", toggled_on)
	
func _ready() -> void:
	var is_dark_mode = PlayerPrefs.get_bool("dark_mode", true)
	_toggled(is_dark_mode)
	button_pressed = is_dark_mode
