extends Button

func _pressed():
	var children = get_children()
	for a in children:
		if a is Control:
			a.show()
	get_tree().current_scene.mobileui()
	


func _on_button_2_pressed():
	get_tree().current_scene.pcui()
	pass # Replace with function body.
