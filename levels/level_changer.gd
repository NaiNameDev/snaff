extends Area3D

@export var scene: PackedScene

func _on_body_entered(body: Node3D) -> void:
	get_tree().change_scene_to_packed(scene)
	Global.pos = body.get_pos()
