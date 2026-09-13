extends Button

func _pressed() -> void:
	$/root/SettingsMenu.visible = true

func _input(event: InputEvent) -> void:
	if event.is_action("main_menu_settings"):
		_pressed()
