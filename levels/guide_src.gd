extends Node3D

@export var players: Array[CharacterBody3D]

func _input(event: InputEvent) -> void:
	for i in players:
		i.input.emit(event)

func _ready() -> void:
	$TV.connect("goal_status", gs)
	$TV.connect("interact", guide_enter)
	await get_tree().create_timer(2.0).timeout
	$CanvasLayer/showcaser.showcase("level 0: GUIDE")

func guide_enter(p: CharacterBody3D):
	if !$TV.is_dead:
		$CanvasLayer/Label.text = ""

func gs(gss: bool):
	await get_tree().create_timer(1.5).timeout
	if gss:
		$CanvasLayer/Label.text = "HE SUCCESSFULLY BLEW UP THE DOOR!!"
		$door.queue_free()
	else:
		$CanvasLayer/Label.text = "HE WERE TOO FAR FROM THE DOOR TO BLOW IT UP, TRY AGAIN!"
		await get_tree().create_timer(5).timeout
		get_tree().reload_current_scene()
		
