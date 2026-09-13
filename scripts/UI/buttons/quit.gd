extends Button

func _pressed() -> void:
	get_tree().quit(0)

func _input(event: InputEvent) -> void:
	if event.is_action("main_menu_quit"):
		_pressed()
