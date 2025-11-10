extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

signal input(event: InputEvent)

@export var camera: Camera3D
@export var intercatc_ray: RayCast3D
@export var tv: Interactable

@export var focus: bool = false

@export var item: Items.items = Items.items.DEF

var goal: bool = false

func _physics_process(delta: float) -> void:
	if focus:
		if Input.is_action_just_pressed("action"):
			use()
		interact()
		move(delta)
	move_and_slide()

func use():
	if item != Items.items.DEF:
		if item == Items.items.GRANADE:
			item = Items.items.DEF
			tv.on_kill()
			await get_tree().create_timer(0.4).timeout
			$AudioStreamPlayer3D.play()
			$OmniLight3D.visible = true
			$exploision_radius.monitoring = true
			await get_tree().create_timer(0.1).timeout
			$AudioStreamPlayer3D.stop()
			tv.goal_status.emit(goal)
			$OmniLight3D.visible = false
			$CollisionShape3D.queue_free()

func machine_death():
	tv.on_kill()
	for i in 16: await camera_shake()

func camera_shake():
	var old = camera.position
	camera.position += Vector3(randf_range(0.05,0.15), randf_range(0.05,0.15), randf_range(0.05,0.15))
	await get_tree().create_timer(0.06).timeout
	camera.position = old

func interact() -> void:
	if Input.is_action_just_pressed("action") and intercatc_ray.get_collider():
		intercatc_ray.get_collider().interact.emit(self)

func move(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	var input_dir := Input.get_vector("left", "right", "up", "down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

func _on_exploision_radius_body_entered(body: Node3D) -> void:
	goal = true
