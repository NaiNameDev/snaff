extends Node3D

@export var players: Array[CharacterBody3D]

func _ready() -> void:
	$TV.connect("goal_status", gs)
	$TV2.connect("goal_status", gs)
	$TV3.connect("goal_status", gs)
	$TV4.connect("goal_status", gs)
	$TV5.connect("goal_status", gs)
	$TV6.connect("goal_status", gs)
	
	await get_tree().create_timer(2.0).timeout
	$CanvasLayer2/showcaser.showcase("episode 4: MEAT")

func _input(event: InputEvent) -> void:
	for i in players:
		i.input.emit(event)

func gs(v: bool):
	if v:
		$door.queue_free()


var can = true
func _on_blockopriemnik_insert() -> void:
	if can:
		$metal_door2/Cube2.queue_free()
		can = false

var can2 = true
func _on_blockopriemnik_2_insert() -> void:
	if can2:
		$metal_door2/Cube3.queue_free()
		can2 = false

var can3 = true
func _on_blood_energy_power() -> void:
	if can3:
		$metal_door/Cube.queue_free()
		can3 = false

var can4 = true
func _on_blood_energy_2_power() -> void:
	if can4:
		$metal_door2/Cube.queue_free()
		can4 = false


func _on_area_3d_body_entered(body: Node3D) -> void:
	body.machine_death()
