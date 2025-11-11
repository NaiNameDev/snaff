extends Interactable

signal goal_status(status: bool)

@export var view_port: SubViewport

@export var focus_point: Node3D
@export var look_point: Node3D

@export var player: CharacterBody3D
@export var sub_player: CharacterBody3D

@export var audio_player: AudioStreamPlayer3D

var is_dead: bool = false

func _ready() -> void:
	connect("interact", on_interact)
	$Sprite3D.material_override.set_shader_parameter("SCREEN_TEXTURE", view_port.get_texture())
	audio_player.play()
	image_state(true)

func image_state(state: bool):
	$Sprite3D.material_override.set_shader_parameter("full_noise", !state)
	if state:
		audio_player.stop()
	else:
		audio_player.play()

func on_interact(player_self: CharacterBody3D) -> void:
	if !is_dead:
		if player_self.state == player_self.DEF:
			player_self.focus_on(focus_point.global_position, look_point.global_position)
			sub_player.set_focus(true)
		if player_self.state == player_self.ONFOCUS:
			player_self.unfocus()
			sub_player.set_focus(false)

func on_kill():
	is_dead = true
	await get_tree().create_timer(0.5).timeout
	image_state(false)
	await get_tree().create_timer(1.5).timeout
	player.unfocus()
	sub_player.set_focus(false)
