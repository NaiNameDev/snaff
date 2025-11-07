extends Node3D

@export var players: Array[CharacterBody3D]

func _input(event: InputEvent) -> void:
	for i in players:
		if i.visible:
			i.input.emit(event)
