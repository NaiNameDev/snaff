extends Node3D

@export var players: Array[CharacterBody3D]

func _ready() -> void:
	await get_tree().create_timer(2.0).timeout
	$CanvasLayer/showcaser.showcase("episode 3: BRIDGES")

func _input(event: InputEvent) -> void:
	for i in players:
		i.input.emit(event)
