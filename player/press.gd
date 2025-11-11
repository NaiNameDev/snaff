extends Node3D

var pressed: bool = false
@export var block: PackedScene

func _on_area_3d_body_entered(body: Node3D) -> void:
	if !pressed:
		$AnimationPlayer.play("press")
		$AudioStreamPlayer3D.play()
		await get_tree().create_timer(0.5).timeout
		body.machine_death()
		$AudioStreamPlayer3D2.play(3.14)
		pressed = true
		await get_tree().create_timer(0.5).timeout
		$AudioStreamPlayer3D2.stop()
		$AudioStreamPlayer3D.stop()
		$Node3D.add_child(block.instantiate())
