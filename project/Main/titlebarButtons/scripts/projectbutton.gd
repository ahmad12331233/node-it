extends Button

func _pressed():
	$AnimationPlayer.play("open")
	pass

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if get_child(0).visible:
				get_tree().create_timer(0.1).timeout.connect(__hide)

func __hide():
	$Panel.visible = false

