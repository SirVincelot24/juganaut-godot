extends HSlider

var master_bus = AudioServer.get_bus_index("Master")
var music_bus = AudioServer.get_bus_index("Music")
var sfx_bus = AudioServer.get_bus_index("SFX")

func change_volume(bus: int, volume: float):
	AudioServer.set_bus_volume_db(bus, linear_to_db(volume))
	var pref_name: String
	match bus:
		master_bus:
			pref_name = "master_vol"
		music_bus:
			pref_name = "music_vol"
		sfx_bus:
			pref_name = "sfx_vol"
	PlayerPrefs.set_pref(pref_name, volume)

func _value_changed(value: float):
	change_volume(master_bus, value)

func _music_value_changed(value: float):
	change_volume(music_bus, value)

func _sfx_value_changed(value: float):
	change_volume(sfx_bus, value)

func _ready() -> void:
	change_volume(master_bus, PlayerPrefs.get_float("master_vol", 1))
	change_volume(music_bus, PlayerPrefs.get_float("music_vol", 1))
	change_volume(sfx_bus, PlayerPrefs.get_float("sfx_vol", 1))
