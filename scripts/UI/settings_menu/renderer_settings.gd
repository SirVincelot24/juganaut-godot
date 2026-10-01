extends VBoxContainer

func _on_follow_player_btn_toggled(toggled_on: bool) -> void:
	PlayerPrefs.set_pref("follow_player", toggled_on)

func _ready() -> void:
	$FollowPlayerBtn.button_pressed = PlayerPrefs.get_bool("follow_player", true)
