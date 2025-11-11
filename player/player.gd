extends CharacterBody3D
enum {
	DEF,
	TRANS,
	ONFOCUS,
	PAUSE,
}

var state = DEF

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

@export var camera: Camera3D
@export var intercatc_ray: RayCast3D

func _ready() -> void:
	$noise.play()
	await get_tree().create_timer(1.0).timeout
	$CanvasLayer/noise.visible = false
	$noise.stop()

func pause():
	state = PAUSE
	$CanvasLayer/Panel.visible = true
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED

func unpause():
	state = DEF
	$CanvasLayer/Panel.visible = false
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func pouse_check():
	if Input.is_action_just_pressed("pause"):
		if state == PAUSE:
			unpause()
		else:
			pause()

func _physics_process(delta: float) -> void:
	match state:
		DEF:
			interact()
			move(delta)
			pouse_check()
		TRANS:
			$CanvasLayer/Sprite2D.visible = false
			velocity = Vector3(0,0,0)
		ONFOCUS:
			interact()
		PAUSE:
			pouse_check()
			velocity = Vector3(0,0,0)
	move_and_slide()

func focus_on(pos: Vector3, look: Vector3):
	state = TRANS
	var oldrot = camera.global_rotation
	camera.look_at(camera.global_position + (look - pos))
	var rot = camera.global_rotation
	camera.global_rotation = oldrot
	
	var twn1 = camera.create_tween()
	var twn2 = create_tween()
	var twn3 = camera.create_tween()
	twn1.set_trans(Tween.TRANS_SINE)
	twn2.set_trans(Tween.TRANS_SINE)
	twn1.tween_property(camera, "global_position", pos, (pos.length() + global_position.length()) / 10)
	twn3.tween_property(camera, "global_rotation", Vector3(rot.x, rot.y,0), 0.5)
	await twn2.tween_property(self, "global_rotation", Vector3(rot.x, rot.y,0), 0.5).finished
	state = ONFOCUS

func unfocus():
	state = TRANS
	var twn1 = camera.create_tween()
	twn1.set_trans(Tween.TRANS_SINE)
	await twn1.tween_property(camera, "global_position", global_position + Vector3(0,0.8,0), 0.5).finished
	state = DEF

func interact() -> void:
	if intercatc_ray.get_collider():
		if state == DEF:
			$CanvasLayer/Sprite2D.visible = true
		else:
			$CanvasLayer/Sprite2D.visible = false
		if Input.is_action_just_pressed("tv_use"):
			intercatc_ray.get_collider().interact.emit(self)
	else:
		$CanvasLayer/Sprite2D.visible = false

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


func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/menu.tscn")

func _on_cont_pressed() -> void:
	unpause()
