extends GridContainer

@onready var width_label = $WidthLabel
@onready var height_label = $HeightLabel
@onready var diamonds_label = $DiamondsLabel

var width: int
var height: int
var diamonds: Vector2

func _on_width_changed(value: float) -> void:
	width_label.text = str(int(value))
	width = value

func _on_height_changed(value: float) -> void:
	height_label.text = str(int(value))
	height = value

func _on_slider_drag_ended(value_changed: bool) -> void:
	PlayerPrefs.set_pref("world_size", Vector2(width, height))
	PlayerPrefs.set_pref("diamonds", diamonds)

func _on_diamonds_changed(range_begin: int, range_end: int) -> void:
	diamonds_label.text = str(range_begin) + " - " + str(range_end)
	diamonds = Vector2(range_begin, range_end)
	PlayerPrefs.set_pref("diamonds", diamonds)

func _ready() -> void:
	var world_size = PlayerPrefs.get_vec2("world_size", Vector2(10, 10))
	var _diamonds: Vector2 = PlayerPrefs.get_vec2("diamonds", Vector2(10, 20))
	_on_diamonds_changed(_diamonds.x, _diamonds.y)
	$WidthSlider.value = world_size.x
	$HeightSlider.value = world_size.y
	$DiamondsSlider.range_begin = _diamonds.x
	$DiamondsSlider.range_end = _diamonds.y
