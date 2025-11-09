extends Node3D

@export var players: Array[CharacterBody3D]

func _ready() -> void:
	$TV.connect("goal_status", gs)
	$SubViewport2/blood_energy.connect("power", power)
	$SubViewport/blood_energy.connect("power", power)
	
	await get_tree().create_timer(2.0).timeout
	$CanvasLayer/showcaser.showcase("level 1: BLOOD MACHINE")

func power():
	$main_level/metal_door.queue_free()

func gs(v: bool):
	if v:
		$SubViewport/door.queue_free()
		$SubViewport2/door.queue_free()
		$door.queue_free()

func _input(event: InputEvent) -> void:
	for i in players:
		i.input.emit(event)
