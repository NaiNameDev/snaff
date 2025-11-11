extends Interactable

signal insert

func _ready() -> void:
	connect("interact", on_interact)

func on_interact(player_self: CharacterBody3D) -> void:
	if player_self.item == Items.items.FLESH_BLOCK:
		$AudioStreamPlayer.play(3.14)
		player_self.item = Items.items.DEF
		player_self.un_pick_flesh()
		insert.emit()
		await get_tree().create_timer(1.42).timeout
		$AudioStreamPlayer.stop()
