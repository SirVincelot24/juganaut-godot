class_name WorldBuilder

var grid: TileMapLayer
var player = preload("res://scenes/character.tscn").instantiate()

func _init(grid_node: TileMapLayer) -> void:
	grid = grid_node

func get_valid_coord(world_size: Vector2i, player_coord: Vector2i) -> Vector2i:
	var x = randi_range(0, world_size.x)
	var y = randi_range(0, world_size.y)
	while Vector2i(x, y) == player_coord:
		x = randi_range(0, world_size.x)
		y = randi_range(0, world_size.y)
	return Vector2i(x, y)

func create_world(size: Vector2i, diamond_count_range, player_coord: Vector2i):
	player.position = grid.map_to_local(player_coord)
	grid.add_child(player)
