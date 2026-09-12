extends Button

func _pressed() -> void:
	get_tree().root.remove_child($/root/SettingsMenu)
