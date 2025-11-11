extends Interactable

func _ready() -> void:
	connect("interact", on_interact)

func on_interact(player: CharacterBody3D):
	if player.item == Items.items.DEF:
		player.item = Items.items.GRANADE
		player.play_pick()
		queue_free()
