extends Button

func _pressed() -> void:
	var settings_menu = $/root/SettingsMenu 
	settings_menu.show()
	$/root/MainMenu.hide()

func _input(event: InputEvent) -> void:
	if event.is_action("main_menu_settings"):
		_pressed()
