extends Button

var settings_scene = preload("res://scenes/settings_menu.tscn").instantiate()

func _pressed() -> void:
	settings_scene.visible = true
	
func _ready() -> void:
	get_tree().current_scene.add_sibling.call_deferred(settings_scene)
	settings_scene.visible = false
