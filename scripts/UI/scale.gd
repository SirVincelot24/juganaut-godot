extends VBoxContainer

var displayScale = 1
@onready var scaleSlider = $HBoxContainer/ScaleSlider
@onready var scaleLabel = $ScaleLabel
var isReady = false

func change_scale(value: float) -> void:
	displayScale = value
	scaleLabel.text = tr("scale") + ": " + TranslationServer.format_number(str(value), TranslationServer.get_locale())

func apply_scale() -> void:
	get_tree().root.content_scale_factor = displayScale
	PlayerPrefs.set_pref("displayScale", displayScale)

func _notification(what: int) -> void:
	if what == NOTIFICATION_TRANSLATION_CHANGED and isReady:
		change_scale(displayScale)

func _ready() -> void:
	change_scale(PlayerPrefs.get_float("displayScale", 1))
	scaleSlider.value = displayScale
	apply_scale()
	isReady = true
