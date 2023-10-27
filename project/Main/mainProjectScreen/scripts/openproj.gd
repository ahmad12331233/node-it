extends Button

func _openproject(path):
	Events.OpenProject(path)
	pass

func _pressed():
	var inst = preload("res://Main/PopupFileManager/PopupFileManager.tscn").instantiate()
	Events.addtoscreen.emit(inst)
	inst.File_selected.connect(_openproject)
	inst.path = "/sdcard/projects"
	inst.update()
	pass
