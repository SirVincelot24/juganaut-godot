extends Control

func _input(event: InputEvent) -> void:
	if !$"/root/SettingsMenu".visible:
		return
	if event.is_action("ui_close_dialog"):
		_on_click_back()

func _on_click_back() -> void:
	$/root/SettingsMenu.hide()
	$/root/MainMenu.show()

func _notification(what: int) -> void:
	if what == NOTIFICATION_WM_GO_BACK_REQUEST:
		_on_click_back()
