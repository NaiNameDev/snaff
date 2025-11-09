extends Label

func showcase(showtext: String):
	text = showtext
	var twn: Tween = create_tween()
	twn.set_trans(Tween.TRANS_SINE)
	
	await twn.tween_property(self, "modulate", Color(1.0,1.0,1.0, 1.0), 1.0).finished
	await get_tree().create_timer(1.0).timeout
	var twn2: Tween = create_tween()
	twn2.set_trans(Tween.TRANS_SINE)
	twn2.tween_property(self, "modulate", Color(1.0,1.0,1.0, 0.0), 1.0)
