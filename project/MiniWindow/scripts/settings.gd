extends Button

func _pressed():
	for a in get_children():
		a.visible = !a.visible
		pass
	pass
