extends Interactable

func _ready() -> void:
	connect("interact", pick)

func pick(p: CharacterBody3D):
	Global.utkacnt += 1
	queue_free()
