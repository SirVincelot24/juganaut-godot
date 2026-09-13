extends Button

func _pressed() -> void:
	$/root/SettingsMenu.visible = false

func _input(event: InputEvent) -> void:
	if event.is_action("ui_close_dialog"):
		_pressed()
