extends Node2D

var collected_diamonds = 0
var diamonds_in_game = 1
@onready var diamond_label = $UI/Control/TopBar/DiamondCount
@onready var won_game_desc = $UI/Control/WonGame/Description
@onready var game_over_desc = $UI/Control/GameOver/Description

func _ready() -> void:
	ThemeManager.apply_theme()
	update_diamond_label()

func collect_diamond():
	collected_diamonds += 1
	SoundManager.play_sound("collect_diamond")
	update_diamond_label()
	if collected_diamonds >= diamonds_in_game:
		win_game("all_diamonds")

func update_diamond_label():
	diamond_label.text = tr("diamondCount")\
	.format({diamondsInGame = diamonds_in_game,
	 diamondCount = collected_diamonds})

func win_game(reason: String):
	SoundManager.play_sound("win")
	won_game_desc.get_parent().show()
	match reason:
		"all_diamonds":
			won_game_desc.text = tr("win." + reason).format({diamonds = collected_diamonds})
		_:
			won_game_desc.text = tr("win." + reason)

func game_over(reason: String):
	SoundManager.play_sound("game_over")
	game_over_desc.get_parent().show()
	match reason:
		_:
			game_over_desc.text = tr("death." + reason)
