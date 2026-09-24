extends Node

@onready var sfx: Dictionary = {
	crisp = $Crisp,
	collect_diamond = $CollectDiamond,
	win = $Win,
	game_over = $GameOver
}

@onready var music = $Music

func play_sound(key: String):
	var sound = sfx[key]
	if sound is AudioStreamPlayer:
		sound.play()
	else:
		printerr("Sound " + key + " not found!")

func play_music(key: String):
	music.stream = load("res://audio/music/" + key + ".wav")
	music.play()

func stop_all() -> void:
	music.stop()
	
