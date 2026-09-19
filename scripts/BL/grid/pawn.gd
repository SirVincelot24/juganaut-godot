class_name Pawn
extends Node2D

enum CellType {
	PLAYER,
	ROCK,
	DIRT,
	MONSTER,
	DIAMOND,
	BOMB,
}

@export var type: CellType = CellType.PLAYER

var active = true: set = set_active

func set_active(value):
	active = value
	set_process(value)
	set_process_input(value)
