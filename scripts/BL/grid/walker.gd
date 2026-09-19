extends Pawn

var grid_size
@onready var parent = get_parent()
var walk_animation_time = .5

func _ready() -> void:
	grid_size = parent.tile_set.tile_size.x

func _process(_delta):
	var input_direction = get_input_direction()
	if input_direction.is_zero_approx():
		return
	
	var target_pos = parent.request_move(self, input_direction)
	if target_pos:
		move_to(target_pos)


func get_input_direction():
	return Vector2(
		Input.get_action_strength("movement.right") - Input.get_action_strength("movement.left"),
		Input.get_action_strength("movement.down") - Input.get_action_strength("movement.up")
	)

func move_to(target_pos):
	set_process(false)
	var move_direction = (target_pos - position).normalized()
	
	var tween := create_tween()
	tween.set_ease(Tween.EASE_IN)
	var end = $Pivot.position + move_direction * grid_size
	tween.tween_property($Pivot, "position", end, walk_animation_time)
	
	await tween.finished
	$Pivot.position = Vector2.ZERO
	position = target_pos
	
	set_process(true)
