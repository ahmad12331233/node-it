extends Button

func _pressed():
	
	var _inst = preload("res://Main/ProjectFileManager/graphname.tscn").instantiate()
	
	
	
	get_tree().root.add_child(_inst)
	_inst.filemanager = $"../../../../.."
	$"../../../../..".update()
	pass
