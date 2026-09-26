class_name WorldBuilder

var grid: TileMapLayer
var player = preload("res://scenes/character.tscn").instantiate()
var size: Vector2i
var world: Array[Array]
var diamonds_in_game: int = 0

func _init(grid_node: TileMapLayer, world_size: Vector2i) -> void:
	grid = grid_node
	size = world_size
	world.resize(size.x)
	var col: Array
	col.resize(size.y)
	col.fill(Pawn.CellType.DIRT)
	for i in range(size.x):
		world[i] = (col.duplicate())

func get_valid_coord(world_size: Vector2i, player_coord: Vector2i) -> Vector2i:
	var x = randi_range(0, world_size.x - 1)
	var y = randi_range(0, world_size.y - 1)
	while Vector2i(x, y) == player_coord:
		x = randi_range(0, world_size.x - 1)
		y = randi_range(0, world_size.y - 1)
	return Vector2i(x, y)

func is_valid_coord(coord: Vector2i) -> bool:
	return coord.x in range(0, size.x) and coord.y in range(0, size.y)

func create_world(world_size: Vector2i,
		diamond_count_range: Vector2i,
		monster_count_range: Vector2i,
		bomb_count_range: Vector2i,
		rock_count_range: Vector2i,
		player_coord: Vector2i):
	create_items(world_size, rock_count_range, player_coord, Pawn.CellType.ROCK)
	create_items(world_size, monster_count_range, player_coord, Pawn.CellType.MONSTER)
	create_items(world_size, bomb_count_range, player_coord, Pawn.CellType.BOMB)
	create_items(world_size, diamond_count_range, player_coord, Pawn.CellType.DIAMOND)
	player.position = grid.map_to_local(player_coord)
	grid.add_child(player)
	var next_to_player = [
		player_coord + Vector2i.UP,
		player_coord + Vector2i.DOWN,
		player_coord + Vector2i.LEFT,
		player_coord + Vector2i.RIGHT,
	]
	for coord in next_to_player:
		if !is_valid_coord(coord):
			break
		if get_world_item(coord) != Pawn.CellType.DIAMOND:
			set_world_item(coord, Pawn.CellType.DIRT)
	place_items_on_grid()

func get_world_item(coord: Vector2i) -> Pawn.CellType:
	return world[coord.x][coord.y]

func set_world_item(coord: Vector2i, item: Pawn.CellType) -> void:
	world[coord.x][coord.y] = item

func place_items_on_grid():
	var x = 0
	var y = 0
	print("placing items")
	for col in world:
		for item in col:
			grid.set_cell(Vector2i(x, y), item, Vector2i.ZERO)
			y+=1
		y = 0
		x+=1

func create_items(world_size: Vector2i, item_count_range: Vector2i, player_coord: Vector2i, item: Pawn.CellType):
	var item_count = randi_range(item_count_range.x, item_count_range.y)
	if item == Pawn.CellType.DIAMOND:
		diamonds_in_game = item_count
	for i in range(item_count):
		#grid.set_cell(get_valid_coord(world_size, player_coord), item, Vector2i.ZERO)
		set_world_item(get_valid_coord(world_size, player_coord), item)
