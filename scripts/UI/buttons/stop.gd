extends Button

func _pressed() -> void:
	get_tree().call_deferred("change_scene_to_file", "res://scenes/MainMenu.tscn")

func _input(event: InputEvent) -> void:
	if event.is_action("ui_close_dialog"):
		_pressed()

func _notification(what: int) -> void:
	if what == NOTIFICATION_WM_GO_BACK_REQUEST:
		_pressed()
