extends Area3D

signal power

@export var animator1: AnimationPlayer
@export var animator2: AnimationPlayer
@export var animator3: AnimationPlayer
@export var animator4: AnimationPlayer

@export var active: bool = true

func _ready() -> void:
	if active:
		animator1.get_animation("a").loop_mode = Animation.LOOP_LINEAR
		animator2.get_animation("a").loop_mode = Animation.LOOP_LINEAR
		animator3.get_animation("a").loop_mode = Animation.LOOP_LINEAR
		animator4.get_animation("a").loop_mode = Animation.LOOP_LINEAR
		animator1.play("a")
		animator2.play("a")
		animator3.play("a")
		animator4.play("a")

func _on_body_entered(body: Node3D) -> void:
	if active:
		$AudioStreamPlayer3D2.play()
		power.emit()
		body.machine_death()
		await get_tree().create_timer(0.5).timeout
		$AudioStreamPlayer3D2.stop()
