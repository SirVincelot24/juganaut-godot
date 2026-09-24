extends Pawn

var grid_size
@onready var parent = get_parent()
var isTouch = false
var walk_animation_time = .5
var touchPos

func _ready() -> void:
	grid_size = parent.tile_set.tile_size.x
	isTouch = DisplayServer.is_touchscreen_available()

func _process(_delta):
	var input_direction = get_input_direction()
	if input_direction.is_zero_approx():
		return
	
	var target_pos = parent.request_move(self, input_direction)
	if target_pos:
		move_to(target_pos)

func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		touchPos = event.position
	if event is InputEventScreenDrag:
		touchPos = event.position
	if event is InputEventScreenTouch and !event.is_pressed():
		touchPos = null

func get_input_direction():
	#return Vector2(
		#Input.get_action_strength("movement.right") - Input.get_action_strength("movement.left"),
		#Input.get_action_strength("movement.down") - Input.get_action_strength("movement.up")
	#)
	if !isTouch:
		return Input.get_vector("movement.left", "movement.right", "movement.up", "movement.down")
	if touchPos:
		var center = get_viewport_rect().size / 2
		var dist: Vector2 = touchPos - center
		var isVertical: bool = abs(dist.y) > abs(dist.x)
		if isVertical:
			return Vector2(0, -1) if dist.y < 0 else Vector2(0, 1)
		else:
			return Vector2(-1, 0) if dist.x < 0 else Vector2(1, 0)
	return Vector2.ZERO


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
