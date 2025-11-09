extends Interactable

func _ready() -> void:
	connect("interact", on_interact)

func on_interact(player: CharacterBody3D):
	player.item = Items.items.GRANADE
	queue_free()
