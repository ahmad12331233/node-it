extends Button


func _pressed():
	var inst = preload("res://Main/createProjectPopup/NewProjPopup.tscn").instantiate()
	Events.addtoscreen.emit(inst)
	pass
