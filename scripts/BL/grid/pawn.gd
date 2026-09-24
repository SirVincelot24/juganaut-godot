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
	process_mode = Node.PROCESS_MODE_INHERIT if value else PROCESS_MODE_DISABLED 
	set_process(value)
	set_process_input(value)
