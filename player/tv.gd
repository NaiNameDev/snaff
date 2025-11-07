extends Interactable

@export var view_port: SubViewport
@export var player: CharacterBody3D

func _ready() -> void:
	connect("interact", on_interact)
	var shader: ShaderMaterial = $Sprite3D.material_override
	shader.set_shader_parameter("SCREEN_TEXTURE", view_port.get_texture())

func on_interact() -> void:
	print("interact")
	$Sprite3D.visible = !$Sprite3D.visible
	player.focus_on($Sprite3D/Node3D.global_position)
	player.camera.look_at(player.camera.global_position + ($Sprite3D/Node3D2.global_position - $Sprite3D/Node3D.global_position))
	player.can_move = false
