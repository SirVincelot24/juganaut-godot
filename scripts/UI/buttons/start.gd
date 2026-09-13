extends Button

func _pressed() -> void:
	get_tree().call_deferred("change_scene_to_file", "res://scenes/game.tscn")

func _input(event: InputEvent) -> void:
	if event.is_action("main_menu_play"):
		_pressed()
