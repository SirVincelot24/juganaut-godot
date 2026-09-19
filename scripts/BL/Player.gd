extends Sprite2D

const GRID_SIZE = 40
var direction: Space.Direction

func _input(event: InputEvent) -> void:
	if event.is_action("movement.up"):
		direction = Space.Direction.UP
	elif event.is_action("movement.down"):
		direction = Space.Direction.DOWN
	elif event.is_action("movement.left"):
		direction = Space.Direction.LEFT
	elif event.is_action("movement.right"):
		direction = Space.Direction.RIGHT
	else:
		return
	var vec = Space.direction2vector(direction) * GRID_SIZE
	translate(vec)
	await get_tree().create_timer(1).timeout
	#print(Input.get_vector("movement.left", "movement.right", "movement.up", "movement.down") as Vector2i)
