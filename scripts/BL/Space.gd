extends Node
class_name Space
enum Direction {
	UP,
	RIGHT,
	DOWN,
	LEFT
}
static func direction2vector(direction: Direction) -> Vector2i:
	match direction:
		Space.Direction.UP:
			return Vector2i.UP
		Space.Direction.DOWN:
			return Vector2i.DOWN
		Space.Direction.LEFT:
			return Vector2i.LEFT
		Space.Direction.RIGHT:
			return Vector2i.RIGHT
		_:
			return Vector2i.ZERO
