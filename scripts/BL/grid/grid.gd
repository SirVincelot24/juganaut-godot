extends TileMapLayer

@export var max_size = Vector2i(10, 10)

func game_over(reason: String):
	set_process(false)

func _ready():
	set_process(true)
	for child in get_children():
		set_cell(local_to_map(child.position), child.type, Vector2i.ZERO)

func get_cell_pawn(cell, type = Pawn.CellType.PLAYER):
	for node in get_children():
		if node.type != type:
			continue
		if local_to_map(node.position) == cell:
			return(node)

func request_move(pawn, direction: Vector2i):
	var cell_start = local_to_map(pawn.position)
	var cell_target = cell_start + direction
	if !cell_target.x in range(0, max_size.x + 1) or !cell_target.y  in range(0, max_size.y + 1):
		#print("OOB:", cell_target)
		return
	
	var cell_tile_id = get_cell_source_id(cell_target)
	match cell_tile_id:
		-1:
			set_cell(cell_target, pawn.type, Vector2i.ZERO)
			set_cell(cell_start, -1, Vector2i.ZERO)
			return map_to_local(cell_target)
		Pawn.CellType.DIRT:
			set_cell(cell_target, pawn.type, Vector2i.ZERO)
			set_cell(cell_start, -1, Vector2i.ZERO)
			SoundManager.play_sound("crisp")
			return map_to_local(cell_target)
		Pawn.CellType.DIAMOND:
			set_cell(cell_target, pawn.type, Vector2i.ZERO)
			set_cell(cell_start, -1, Vector2i.ZERO)
			$"/root/Game".collect_diamond()
			return map_to_local(cell_target)
		Pawn.CellType.MONSTER:
			$/root/Game.game_over("player_walks_into_monster")
			set_cell(cell_start, -1, Vector2i.ZERO)
		_:
			var target_pawn = get_cell_pawn(cell_target, cell_tile_id)
			print("Cell %s contains %s" % [cell_target, target_pawn.name])
