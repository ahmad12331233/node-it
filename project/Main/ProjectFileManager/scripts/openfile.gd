extends Button


func _pressed():
	
	if owner._str.get_extension() == "graph":
		var inst = preload("res://Graph/Graph.tscn").instantiate()
		Events.addTab.emit(inst, owner._str.split(".")[0], owner.path)
		if inst == null : return
		inst.Fload(owner.path + "/" + owner._str)
	
	pass
