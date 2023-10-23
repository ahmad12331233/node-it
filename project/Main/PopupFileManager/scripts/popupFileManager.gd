extends Control

@export var path : String = "/sdcard"
@export var window : TabContainer
@export var UIfilecontainer : BoxContainer
@export var lineedit : LineEdit


@export var openfolder : bool
@export var allowedTypes : PackedStringArray
@export var typecheck : bool


signal File_selected( Fpath : String)



func selected(_text : String):
	if typecheck:
		for a in allowedTypes:
			if _text.get_extension() == a:
				File_selected.emit(path + "/" + _text)
				queue_free()
				return
	else:
		File_selected.emit(path + "/" + _text)
		queue_free()
	pass

func _ready():
	if openfolder: $popup/BoxContainer/pathPanel/v/Label.text = "افتح مجلد"
	
	update()
	pass

func updatepath():
	path = get_tree().root.get_child(1).ProjectPath

func update():
	#$filesanim.stop()
	$filesanim.play("flip")
	get_tree().create_timer(0.05).timeout.connect(updateintern)
	pass

func updateintern():
	for a in UIfilecontainer.get_children():
		a.queue_free()
		pass
	#$filesanim.stop()
	$filesanim.play("open")
	
	if DirAccess.dir_exists_absolute(path):
		var dir = DirAccess.open(path)
		if dir == null: return
		if dir.get_directories().size() >= 1:
			for a in dir.get_directories():
				var inst = preload("res://Main/PopupFileManager/Folder.tscn").instantiate()
				UIfilecontainer.add_child(inst)
				inst._str = a
				inst.path = path
				inst.control = $"."
		
		if dir.get_files().size() >= 1:
			for a in dir.get_files():
				if typecheck:
					for e in allowedTypes:
						if a.get_extension() == e:
							var inst = preload("res://Main/PopupFileManager/file.tscn").instantiate()
							UIfilecontainer.add_child(inst)
							inst._str = a
							inst.path = path
							inst.control = $"."
				else:
					var inst = preload("res://Main/PopupFileManager/file.tscn").instantiate()
					UIfilecontainer.add_child(inst)
					inst._str = a
					inst.path = path
					inst.control = $"."
		lineedit.text = path
	
	pass




func _on_up_pressed():
	var newpath = path.split("/")
	newpath.remove_at(newpath.size()-1)
	path = "/"
	for a in newpath:
		path = path.path_join(a)
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


func _on_control_on_close():
	queue_free()
	
	pass # Replace with function body.
