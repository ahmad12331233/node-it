extends Control


func _on_text_pressed():
	var win = get_parent().worldorigin
	var inst
	inst = preload("res://MiniWindow/txt.tscn").instantiate()
	if inst == null: return
	win.add_child(inst)
	inst.position = win.get_local_mouse_position()
	$Control.close()

@rpc("any_peer","call_local")
func addtext():
	var win = get_parent().worldorigin
	var inst
	inst = preload("res://MiniWindow/txt.tscn").instantiate()
	#if inst == null: return
	win.add_child(inst)
	#win.spawn("res://MiniWindow/txt.tscn")
	$Control.close()


func _on_control_on_close():
	queue_free()


func _on_graph_pressed():
	var win = get_parent().worldorigin
	var inst
	inst = preload("res://MiniWindow/graph.tscn").instantiate()
	if inst == null: return
	win.add_child(inst)
	inst.position = win.get_local_mouse_position()
	$Control.close()


func _on_photo_pressed():
	var fm = preload("res://Main/PopupFileManager/PopupFileManager.tscn").instantiate()
	Events.addtoscreen.emit(fm)
	var _arr = Events.projectpath.split("/")
	_arr.remove_at(_arr.size() - 1)
	var __string : String = "/"
	for a in _arr:
		#__string += a + "/"
		__string = __string.path_join(a)
	fm.path = __string
	fm.typecheck = false
	fm.update()
	fm.File_selected.connect(_on_popup_file_manager_file_selected)


func _on_popup_file_manager_file_selected(Fpath):
	var win = get_parent().worldorigin
	var inst
	inst = preload("res://MiniWindow/png.tscn").instantiate()
	if inst == null: return
	win.add_child(inst)
	var pos = win.get_local_mouse_position()
	var scal = Vector2(0,0)
	inst.lload(pos,scal,Fpath)
	$Control.close()


func _on_arrow_pressed():
	var win = get_parent().worldorigin
	var inst
	inst = preload("res://MiniWindow/arrow.tscn").instantiate()
	if inst == null: return
	win.add_child(inst)
	inst.position = win.get_local_mouse_position()
	$Control.close()


func _on_draw_pressed():
	var win = get_parent().worldorigin
	var inst
	inst = preload("res://MiniWindow/draw.tscn").instantiate()
	if inst == null: return
	win.add_child(inst)
	inst.position = win.get_local_mouse_position()
	$Control.close()
	pass 
