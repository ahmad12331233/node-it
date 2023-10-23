extends Button

func _pressed():
	
	FileAccess.open($"../../../../..".path + "/new" + String.num(randi()) + ".graph",FileAccess.WRITE).close()
	var inst = preload("res://Graph/Graph.tscn").instantiate()
	get_tree().root.get_child(0).addTab(inst , "New Graph")
	inst.Fload($"../../../../..".path + "/new.graph")
	$"../../../../..".update()
	pass
