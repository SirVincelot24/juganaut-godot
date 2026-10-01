extends GridContainer

@onready var width_label = $WidthLabel
@onready var height_label = $HeightLabel
@onready var diamonds_label = $DiamondsLabel
@onready var monsters_label = $MonstersLabel
@onready var bombs_label = $BombsLabel
@onready var rocks_label = $RocksLabel

var width: int
var height: int
var diamonds: Vector2
var monsters: Vector2
var bombs: Vector2
var rocks: Vector2

class WorldDefaults:
	const world_size: Vector2 = Vector2(20, 20)
	const diamonds: Vector2 = Vector2(10, 30)
	const monsters: Vector2 = Vector2(20, 50)
	const bombs: Vector2 = Vector2(10, 20)
	const rocks: Vector2 = Vector2(20, 50)

func _on_width_changed(value: float) -> void:
	width_label.text = str(int(value))
	width = value

func _on_height_changed(value: float) -> void:
	height_label.text = str(int(value))
	height = value

func _on_slider_drag_ended(value_changed: bool) -> void:
	PlayerPrefs.set_pref("world_size", Vector2(width, height))
	PlayerPrefs.set_pref("diamonds", diamonds)
	PlayerPrefs.set_pref("monsters", monsters)
	PlayerPrefs.set_pref("bombs", bombs)
	PlayerPrefs.set_pref("rocks", rocks)

func _on_diamonds_changed(range_begin: int, range_end: int) -> void:
	diamonds_label.text = str(range_begin) + " - " + str(range_end)
	diamonds = Vector2(range_begin, range_end)
	PlayerPrefs.set_pref("diamonds", diamonds)

func _on_monsters_changed(range_begin: int, range_end: int) -> void:
	monsters_label.text = str(range_begin) + " - " + str(range_end)
	monsters = Vector2(range_begin, range_end)
	PlayerPrefs.set_pref("monsters", monsters)

func _on_bombs_changed(range_begin: int, range_end: int) -> void:
	bombs_label.text = str(range_begin) + " - " + str(range_end)
	bombs = Vector2(range_begin, range_end)
	PlayerPrefs.set_pref("bombs", bombs)

func _on_rocks_changed(range_begin: int, range_end: int) -> void:
	rocks_label.text = str(range_begin) + " - " + str(range_end)
	rocks = Vector2(range_begin, range_end)
	PlayerPrefs.set_pref("rocks", rocks)

func set_settings(world_size: Vector2,
		_diamonds: Vector2,
		_monsters: Vector2,
		_bombs: Vector2,
		_rocks: Vector2
	) -> void:
	_on_width_changed(world_size.x)
	_on_height_changed(world_size.y)
	_on_diamonds_changed(_diamonds.x, _diamonds.y)
	_on_monsters_changed(_monsters.x, _monsters.y)
	_on_bombs_changed(_bombs.x, _bombs.y)
	_on_rocks_changed(_rocks.x, _rocks.y)
	$WidthSlider.value = world_size.x
	$HeightSlider.value = world_size.y
	$DiamondsSlider.range_begin = _diamonds.x
	$DiamondsSlider.range_end = _diamonds.y
	$MonstersSlider.range_begin = _monsters.x
	$MonstersSlider.range_end = _monsters.y
	$BombsSlider.range_begin = _bombs.x
	$BombsSlider.range_end = _bombs.y
	$RocksSlider.range_begin = _rocks.x
	$RocksSlider.range_end = _rocks.y

func _ready() -> void:
	var world_size = PlayerPrefs.get_vec2("world_size", WorldDefaults.world_size)
	var _diamonds: Vector2 = PlayerPrefs.get_vec2("diamonds", WorldDefaults.diamonds)
	var _monsters: Vector2 = PlayerPrefs.get_vec2("monsters", WorldDefaults.monsters)
	var _bombs: Vector2 = PlayerPrefs.get_vec2("bombs", WorldDefaults.bombs)
	var _rocks: Vector2 = PlayerPrefs.get_vec2("rocks", WorldDefaults.rocks)
	set_settings(world_size, _diamonds, _monsters, _bombs, _rocks)

func _on_reset_button_pressed() -> void:
	set_settings(
		WorldDefaults.world_size,
		WorldDefaults.diamonds,
		WorldDefaults.monsters,
		WorldDefaults.bombs,
		WorldDefaults.rocks
	)
