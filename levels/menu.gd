extends Control

var starting: bool = false

func _ready() -> void:
	Global.utkacnt = 0
	Global.deathcnt = 0

func _on_start_pressed() -> void:
	if !starting:
		$Panel.visible = false
		$SubViewportContainer/SubViewport/Node3D/TV.image_state(false)
		$startsound.play()
		
		var mtwn1: Tween = get_tree().create_tween()
		var mtwn2: Tween = get_tree().create_tween()
		var mtwn3: Tween = get_tree().create_tween()
		
		mtwn1.tween_property($Label, "modulate", Color($Label.modulate.r,$Label.modulate.g,$Label.modulate.b,0), 1.0)
		mtwn2.tween_property($episodes, "modulate", Color($episodes.modulate.r,$episodes.modulate.g,$episodes.modulate.b,0), 1.0)
		mtwn3.tween_property($start, "modulate", Color($start.modulate.r,$start.modulate.g,$start.modulate.b,0), 1.0)
		
		starting = true
		var cam: Camera3D = $SubViewportContainer/SubViewport/Node3D/Camera3D
		var twn: Tween = cam.create_tween()
		
		var ttwn_sound = $AudioStreamPlayer.create_tween()
		ttwn_sound.tween_property($AudioStreamPlayer, "volume_db", -20, 1.5)
		
		var ttwn_start_sound = create_tween()
		ttwn_start_sound.tween_property($startsound, "volume_db", -20, 3)
		
		twn.set_trans(Tween.TRANS_BACK)
		twn.tween_property(cam, "global_position", Vector3(cam.global_position.x, cam.global_position.y, -0.436), 2.0)
		await get_tree().create_timer(1.5).timeout
		get_tree().change_scene_to_file("res://levels/guide.tscn")

func _on_episodes_pressed() -> void:
	$Panel.visible = !$Panel.visible

func _on_x_pressed() -> void:
	$Panel.visible = !$Panel.visible

func _on_guide_pressed() -> void:
	if !starting:
		$Panel.visible = false
		$SubViewportContainer/SubViewport/Node3D/TV.image_state(false)
		$startsound.play()
		
		var mtwn1: Tween = get_tree().create_tween()
		var mtwn2: Tween = get_tree().create_tween()
		var mtwn3: Tween = get_tree().create_tween()
		
		mtwn1.tween_property($Label, "modulate", Color($Label.modulate.r,$Label.modulate.g,$Label.modulate.b,0), 1.0)
		mtwn2.tween_property($episodes, "modulate", Color($episodes.modulate.r,$episodes.modulate.g,$episodes.modulate.b,0), 1.0)
		mtwn3.tween_property($start, "modulate", Color($start.modulate.r,$start.modulate.g,$start.modulate.b,0), 1.0)
		
		starting = true
		var cam: Camera3D = $SubViewportContainer/SubViewport/Node3D/Camera3D
		var twn: Tween = cam.create_tween()
		
		var ttwn_sound = $AudioStreamPlayer.create_tween()
		ttwn_sound.tween_property($AudioStreamPlayer, "volume_db", -20, 1.5)
		
		var ttwn_start_sound = create_tween()
		ttwn_start_sound.tween_property($startsound, "volume_db", -20, 3)
		
		twn.set_trans(Tween.TRANS_BACK)
		twn.tween_property(cam, "global_position", Vector3(cam.global_position.x, cam.global_position.y, -0.436), 2.0)
		await get_tree().create_timer(1.5).timeout
		get_tree().change_scene_to_file("res://levels/guide.tscn")

func _on_blood_pressed() -> void:
	if !starting:
		$Panel.visible = false
		$SubViewportContainer/SubViewport/Node3D/TV.image_state(false)
		$startsound.play()
		
		var mtwn1: Tween = get_tree().create_tween()
		var mtwn2: Tween = get_tree().create_tween()
		var mtwn3: Tween = get_tree().create_tween()
		
		mtwn1.tween_property($Label, "modulate", Color($Label.modulate.r,$Label.modulate.g,$Label.modulate.b,0), 1.0)
		mtwn2.tween_property($episodes, "modulate", Color($episodes.modulate.r,$episodes.modulate.g,$episodes.modulate.b,0), 1.0)
		mtwn3.tween_property($start, "modulate", Color($start.modulate.r,$start.modulate.g,$start.modulate.b,0), 1.0)
		
		starting = true
		var cam: Camera3D = $SubViewportContainer/SubViewport/Node3D/Camera3D
		var twn: Tween = cam.create_tween()
		
		var ttwn_sound = $AudioStreamPlayer.create_tween()
		ttwn_sound.tween_property($AudioStreamPlayer, "volume_db", -20, 1.5)
		
		var ttwn_start_sound = create_tween()
		ttwn_start_sound.tween_property($startsound, "volume_db", -20, 3)
		
		twn.set_trans(Tween.TRANS_BACK)
		twn.tween_property(cam, "global_position", Vector3(cam.global_position.x, cam.global_position.y, -0.436), 2.0)
		await get_tree().create_timer(1.5).timeout
		get_tree().change_scene_to_file("res://levels/level_1.tscn")


func _on_fall_pressed() -> void:
	if !starting:
		$Panel.visible = false
		$SubViewportContainer/SubViewport/Node3D/TV.image_state(false)
		$startsound.play()
		
		var mtwn1: Tween = get_tree().create_tween()
		var mtwn2: Tween = get_tree().create_tween()
		var mtwn3: Tween = get_tree().create_tween()
		
		mtwn1.tween_property($Label, "modulate", Color($Label.modulate.r,$Label.modulate.g,$Label.modulate.b,0), 1.0)
		mtwn2.tween_property($episodes, "modulate", Color($episodes.modulate.r,$episodes.modulate.g,$episodes.modulate.b,0), 1.0)
		mtwn3.tween_property($start, "modulate", Color($start.modulate.r,$start.modulate.g,$start.modulate.b,0), 1.0)
		
		starting = true
		var cam: Camera3D = $SubViewportContainer/SubViewport/Node3D/Camera3D
		var twn: Tween = cam.create_tween()
		
		var ttwn_sound = $AudioStreamPlayer.create_tween()
		ttwn_sound.tween_property($AudioStreamPlayer, "volume_db", -20, 1.5)
		
		var ttwn_start_sound = create_tween()
		ttwn_start_sound.tween_property($startsound, "volume_db", -20, 3)
		
		twn.set_trans(Tween.TRANS_BACK)
		twn.tween_property(cam, "global_position", Vector3(cam.global_position.x, cam.global_position.y, -0.436), 2.0)
		await get_tree().create_timer(1.5).timeout
		get_tree().change_scene_to_file("res://levels/level_2.tscn")


func _on_bridges_pressed() -> void:
	if !starting:
		$Panel.visible = false
		$SubViewportContainer/SubViewport/Node3D/TV.image_state(false)
		$startsound.play()
		
		var mtwn1: Tween = get_tree().create_tween()
		var mtwn2: Tween = get_tree().create_tween()
		var mtwn3: Tween = get_tree().create_tween()
		
		mtwn1.tween_property($Label, "modulate", Color($Label.modulate.r,$Label.modulate.g,$Label.modulate.b,0), 1.0)
		mtwn2.tween_property($episodes, "modulate", Color($episodes.modulate.r,$episodes.modulate.g,$episodes.modulate.b,0), 1.0)
		mtwn3.tween_property($start, "modulate", Color($start.modulate.r,$start.modulate.g,$start.modulate.b,0), 1.0)
		
		starting = true
		var cam: Camera3D = $SubViewportContainer/SubViewport/Node3D/Camera3D
		var twn: Tween = cam.create_tween()
		
		var ttwn_sound = $AudioStreamPlayer.create_tween()
		ttwn_sound.tween_property($AudioStreamPlayer, "volume_db", -20, 1.5)
		
		var ttwn_start_sound = create_tween()
		ttwn_start_sound.tween_property($startsound, "volume_db", -20, 3)
		
		twn.set_trans(Tween.TRANS_BACK)
		twn.tween_property(cam, "global_position", Vector3(cam.global_position.x, cam.global_position.y, -0.436), 2.0)
		await get_tree().create_timer(1.5).timeout
		get_tree().change_scene_to_file("res://levels/level_3.tscn")


func _on_meat_pressed() -> void:
	if !starting:
		$Panel.visible = false
		$SubViewportContainer/SubViewport/Node3D/TV.image_state(false)
		$startsound.play()
		
		var mtwn1: Tween = get_tree().create_tween()
		var mtwn2: Tween = get_tree().create_tween()
		var mtwn3: Tween = get_tree().create_tween()
		
		mtwn1.tween_property($Label, "modulate", Color($Label.modulate.r,$Label.modulate.g,$Label.modulate.b,0), 1.0)
		mtwn2.tween_property($episodes, "modulate", Color($episodes.modulate.r,$episodes.modulate.g,$episodes.modulate.b,0), 1.0)
		mtwn3.tween_property($start, "modulate", Color($start.modulate.r,$start.modulate.g,$start.modulate.b,0), 1.0)
		
		starting = true
		var cam: Camera3D = $SubViewportContainer/SubViewport/Node3D/Camera3D
		var twn: Tween = cam.create_tween()
		
		var ttwn_sound = $AudioStreamPlayer.create_tween()
		ttwn_sound.tween_property($AudioStreamPlayer, "volume_db", -20, 1.5)
		
		var ttwn_start_sound = create_tween()
		ttwn_start_sound.tween_property($startsound, "volume_db", -20, 3)
		
		twn.set_trans(Tween.TRANS_BACK)
		twn.tween_property(cam, "global_position", Vector3(cam.global_position.x, cam.global_position.y, -0.436), 2.0)
		await get_tree().create_timer(1.5).timeout
		get_tree().change_scene_to_file("res://levels/level_4.tscn")
