extends Camera3D

@export var player: CharacterBody3D

var rtx: int = 0
var rty: int = 0

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and player.state == player.DEF:
		player.rotate_y(deg_to_rad(-event.relative.x * 0.25))
		rotate_x(deg_to_rad(-event.relative.y * 0.25))
		rotation.x = clamp(rotation.x, deg_to_rad(-89), deg_to_rad(89))
