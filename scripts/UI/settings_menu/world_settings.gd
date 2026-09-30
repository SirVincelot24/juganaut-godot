extends GridContainer

@onready var width_label = $WidthLabel
@onready var height_label = $HeightLabel
@onready var diamonds_label = $DiamondsLabel


func _on_width_changed(value: float) -> void:
	width_label.text = str(int(value))

func _on_height_changed(value: float) -> void:
	height_label.text = str(int(value))

func _on_slider_drag_ended(value_changed: bool) -> void:
	pass # Replace with function body.


func _on_diamonds_changed(range_begin: int, range_end: int) -> void:
	diamonds_label.text = str(range_begin) + " - " + str(range_end)
