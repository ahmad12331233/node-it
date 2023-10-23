extends Button


func _pressed():
	var inst = preload("res://Main/PopupFileManager/PopupFileManager.tscn").instantiate()
	owner.add_child(inst)
	inst.File_selected.connect(_on_file_dialog_dir_selected)
	inst.openfolder = true

func _on_file_dialog_dir_selected(dir):
	$"../LineEdit".text = dir
	pass # Replace with function body.
