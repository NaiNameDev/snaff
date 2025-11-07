extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

@export var camera: Camera3D
@export var intercatc_ray: RayCast3D
@export var can_move: bool = true

@export var anim_time: float = 0.8

func _physics_process(delta: float) -> void:
	if can_move:
		interact()
		move(delta)
	else:
		interact()
		if Input.is_action_just_pressed("action"):
			focus_on(global_position + Vector3(0,0.8,0))
			await get_tree().create_timer(anim_time).timeout
			can_move = true
	move_and_slide()

func focus_on(pos: Vector3):
	var twn: Tween = camera.create_tween()
	twn.tween_property(camera, "global_position", pos, anim_time).set_trans(Tween.TRANS_QUAD)

func interact() -> void:
	if Input.is_action_just_pressed("action") and intercatc_ray.get_collider():
		intercatc_ray.get_collider().interact.emit()

func move(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var input_dir := Input.get_vector("left", "right", "up", "down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
