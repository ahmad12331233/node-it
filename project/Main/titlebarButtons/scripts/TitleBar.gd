extends HBoxContainer

func _on_new_button_down():
	var inst = preload("res://Main/createProjectPopup/NewProjPopup.tscn").instantiate()
	Events.addtoscreen.emit(inst)

func _openproject(path):
	Events.OpenProject(path)
	pass

func _on_open_button_down():
	var inst = preload("res://Main/PopupFileManager/PopupFileManager.tscn").instantiate()
	Events.addtoscreen.emit(inst)
	inst.File_selected.connect(_openproject)
	inst.path = "/sdcard/projects"
	inst.update()
	pass
