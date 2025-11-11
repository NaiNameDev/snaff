extends Node3D

@export var players: Array[CharacterBody3D]

func _ready() -> void:
	$TV.connect("goal_status", gs)
	$TV2.connect("goal_status", gs)
	$TV3.connect("goal_status", gs)
	$TV4.connect("goal_status", gs)
	
	$blockopriemnik.connect("insert", insert)
	
	await get_tree().create_timer(2.0).timeout
	$CanvasLayer/showcaser.showcase("episode 3: BRIDGES")

func insert():
	$Cube2.queue_free()
	$lighjt/SpotLight3D17.visible = true

func gs(v: bool):
	if v:
		$door.queue_free()

func _input(event: InputEvent) -> void:
	for i in players:
		i.input.emit(event)

func _on_blood_energy_power() -> void:
	$Cube.queue_free()


func _on_area_3d_body_entered(body: Node3D) -> void:
	body.machine_death()
