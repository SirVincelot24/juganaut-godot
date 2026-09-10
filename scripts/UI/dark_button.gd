extends CheckButton

func _toggled(toggled_on: bool) -> void:
	ThemeManager.toggle_theme()

func _ready() -> void:
	update_colors()

func update_colors():
	var text_color := \
	#get_theme_color("onPrimaryContainer")
	ThemeManager.theme.onPrimaryContainer
	var btn_clr := \
	ThemeManager.theme.primaryContainer
	#get_theme_color("primaryContainer")
	
	add_theme_color_override("font_color", text_color)
	add_theme_color_override("button_checked_color", btn_clr)
