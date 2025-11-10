extends Node3D

@export var players: Array[CharacterBody3D]

func _ready() -> void:
	$TV.connect("goal_status", gs1)
	$TV3.connect("goal_status", gs2)
	
	$watch_room/blood_energy.connect("power", machine1)
	$watch_room/blood_energy2.connect("power", machine2)
	
	await get_tree().create_timer(2.0).timeout
	$CanvasLayer/showcaser.showcase("episode 2: FALL")

func gs1(v: bool):
	if v:
		$door3.queue_free()
		$door4.queue_free()

func machine1():
	$metal_door.queue_free()
func machine2():
	$metal_door2.queue_free()

func gs2(v: bool):
	if v:
		$door.queue_free()
		$door2.queue_free()

func _input(event: InputEvent) -> void:
	for i in players:
		i.input.emit(event)
