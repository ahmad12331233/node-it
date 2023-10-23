extends Button

func _pressed():
	var inst = preload("res://Main/PopupFileManager/PopupFileManager.tscn").instantiate()
	get_tree().root.get_child(1).add_child(inst)
	inst.typecheck = false
	inst.File_selected.connect(_import)
	pass


func _import(path : String):
	var arr = path.split("/")
	var projpath = get_tree().root.get_child(1).ProjectPath
	DirAccess.copy_absolute(path, projpath + "/" + arr[arr.size()-1])
	get_tree().root.get_child(1).updatefilemanager()
	pass # Replace with function body.
