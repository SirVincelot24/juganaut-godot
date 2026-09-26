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

static func type_to_string(type: CellType) -> String:
	match type:
		CellType.PLAYER:
			return "PLAYER"
		CellType.ROCK:
			return "ROCK"
		CellType.DIRT:
			return "DIRT"
		CellType.MONSTER:
			return "MONSTER"
		CellType.DIAMOND:
			return "DIAMOND"
		CellType.BOMB:
			return "BOMB"
		_:
			return ""

@export var type: CellType = CellType.PLAYER

var active = true: set = set_active

func set_active(value):
	active = value
	process_mode = Node.PROCESS_MODE_INHERIT if value else PROCESS_MODE_DISABLED 
	set_process(value)
	set_process_input(value)
