extends Node3D

var player: CharacterBody3D

func _on_area_3d_body_entered(body: Node3D) -> void:
	$AnimationPlayer.play("press")
	await get_tree().create_timer(0.5).timeout
	body.machine_death()
