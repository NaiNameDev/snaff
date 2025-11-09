extends SubViewport


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$granade.connect("interact", on_granade_pick)

func on_granade_pick(player: CharacterBody3D):
	$CanvasLayer/Label.text = "HE EXPLODE YOURSELF TO OPEN THE DOOR {E}"
