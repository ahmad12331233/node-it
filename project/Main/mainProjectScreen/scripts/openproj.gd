extends Button

func _openproject(path):
	get_tree().root.get_child(1).ProjectFile = path
	get_tree().root.get_child(1).openproj()
	Events.OpenProject(path)
	pass

func _pressed():
	var inst = preload("res://Main/PopupFileManager/PopupFileManager.tscn").instantiate()
	get_tree().root.get_child(1).add_child(inst)
	inst.File_selected.connect(_openproject)
	inst.path = "/sdcard/projects"
	inst.update()
	pass
