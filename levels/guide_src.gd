extends Node3D

@export var players: Array[CharacterBody3D]

func _ready() -> void:
	$TV.connect("goal_status", gs)
	$TV.connect("interact", guide_enter)

func guide_enter(p: CharacterBody3D):
	if !$TV.is_dead:
		$CanvasLayer/Label.text = ""

func gs(gss: bool):
	await get_tree().create_timer(1.5).timeout
	if gss:
		$CanvasLayer/Label.text = "YOU SUCCESSFULLY BLEW UP THE DOOR!!"
		$door.queue_free()
	else:
		$CanvasLayer/Label.text = "YOU WERE TOO FAR FROM THE DOOR TO BLOW IT UP, TRY AGAIN!"
		await get_tree().create_timer(5).timeout
		get_tree().reload_current_scene()
		

func _input(event: InputEvent) -> void:
	for i in players:
		if i.visible:
			i.input.emit(event)
