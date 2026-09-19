extends Node

@onready var crisp = $Crisp
@onready var collect_diamond = $CollectDiamond

func play_sound(key: String):
	var sound = get(key)
	if sound is AudioStreamPlayer:
		sound.play()
	else:
		printerr("Sound " + key + " not found!")
