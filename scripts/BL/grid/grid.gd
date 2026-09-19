extends TileMapLayer

func _ready():
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
			SoundManager.play_sound("collect_diamond")
			return map_to_local(cell_target)
		_:
			var target_pawn = get_cell_pawn(cell_target, cell_tile_id)
			print("Cell %s contains %s" % [cell_target, target_pawn.name])
