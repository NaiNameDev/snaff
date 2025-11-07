extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

signal input(event: InputEvent)

@export var camera: Camera3D
@export var intercatc_ray: RayCast3D

func _physics_process(delta: float) -> void:
	interact()
	move(delta)
	move_and_slide()

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
