extends Node3D

var can: bool = false

func _ready() -> void:
	$sub_player.set_focus(true)
	
	$noise2.play()
	await get_tree().create_timer(3.0).timeout
	$noise2.stop()
	$noise.visible = false
	
	await get_tree().create_timer(2.0).timeout
	$CanvasLayer2/showcaser.showcase("you've reached the end")
	await get_tree().create_timer(5.0).timeout
	$CanvasLayer2/showcaser.showcase("you KILLED " + str(Global.deathcnt) + " people")
	await get_tree().create_timer(5.0).timeout
	$CanvasLayer2/showcaser.showcase("you found " + str(Global.utkacnt) + "/15 ducks")
	await get_tree().create_timer(5.0).timeout
	$CanvasLayer2/showcaser.showcase("time to say goodbye...")
	
	can = true

func _input(event: InputEvent) -> void:
	$sub_player.input.emit(event)

func _on_visible_on_screen_notifier_3d_screen_entered() -> void:
	if can:
		$Node3D.position = Vector3(0,0,0)

func _on_tv_goal_status(status: bool) -> void:
	get_tree().change_scene_to_file("res://levels/menu.tscn")
