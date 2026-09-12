extends Button

func _pressed() -> void:
	var settings_scene = load("res://scenes/settings_menu.tscn").instantiate()
	get_tree().current_scene.add_sibling(settings_scene)
