extends Button

func _pressed() -> void:
	get_tree().root.remove_child($/root/SettingsMenu)

func _input(event: InputEvent) -> void:
	if event.is_action("ui_close_dialog"):
		_pressed()
