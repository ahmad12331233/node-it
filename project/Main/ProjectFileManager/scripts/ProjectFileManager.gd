extends Control

var path : String
@export var window : TabContainer



func updatepath():
	path = get_tree().root.get_child(1).ProjectPath

func update():
	var container : BoxContainer = $BoxContainer/ScrollContainer/BoxContainer
	for a in container.get_children():
		a.queue_free()
		pass
	
	if DirAccess.dir_exists_absolute(path):
		var dir = DirAccess.open(path)
		if dir.get_directories().size() >= 1:
			for a in dir.get_directories():
				var inst = preload("res://Main/ProjectFileManager/Folder.tscn").instantiate()
				container.add_child(inst)
				inst._str = a
				inst.path = path
				inst.control = $"."
		
		if dir.get_files().size() >= 1:
			for a in dir.get_files():
				if a.get_extension() == "proj" : continue
				var inst = preload("res://Main/ProjectFileManager/file.tscn").instantiate()
				container.add_child(inst)
				inst._str = a
				inst.path = path
				inst.control = $"."
	pass




func _on_up_pressed():
	if path == get_tree().root.get_child(1).ProjectPath: return
	var newpath = path.split("/")
	newpath.remove_at(newpath.size()-1)
	var finalpath = "/"
	for a in newpath:
		finalpath = finalpath.path_join(a)
	path = finalpath
	update()
	pass # Replace with function body.


func _on_line_edit_text_submitted(new_text):
	path = new_text
	update()
	pass # Replace with function body.


func _on_option_button_item_selected(index):
	if index == 0:
		path = "/"
		update()
		pass
	if index == 1:
		path = "/sdcard"
		update()
		pass
	if index == 2:
		path = "/home"
		update()
		pass
	pass # Replace with function body.
