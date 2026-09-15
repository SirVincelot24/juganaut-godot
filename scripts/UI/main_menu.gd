extends Control

var portrait_bg = preload("res://textures/menu-background-phone.png")
var landscape_bg = preload("res://textures/menu-background.png")

func update_background():
	var bg_box = $Background.get_theme_stylebox("panel")
	if get_viewport().get_visible_rect().size.aspect() > 1:
		bg_box.texture = landscape_bg
	else :
		bg_box.texture = portrait_bg

func _ready() -> void:
	get_viewport().size_changed.connect(update_background)
	update_background()
