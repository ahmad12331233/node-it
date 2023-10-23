extends Button


func _pressed():
	var inst = preload("res://Main/createProjectPopup/NewProjPopup.tscn").instantiate()
	get_tree().root.get_child(1).add_child(inst)
	
	pass
