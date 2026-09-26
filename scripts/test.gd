@tool
extends EditorScript


# Called when the node enters the scene tree for the first time.
func _run() -> void:
	var size = Vector2i(2, 3)
	var world: Array[Array] = [
		[1, 2, 3],
		[4, 5, 6]
	]
	world.resize(size.x)
	var col: Array
	col.resize(size.y)
	col.fill(Pawn.CellType.DIRT)
	world.fill(col.duplicate(true))
	print(world[1][2])
	world[1][2] = 9
	print(world)
