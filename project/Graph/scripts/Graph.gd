extends Control

@onready var worldorigin = $garphwindow/Zoom/worldOrigin
var filepath = ""
var loaded = false


func Fsave():
	var file = FileAccess.open_encrypted_with_pass(filepath,FileAccess.WRITE,"hehehe")
	var iconpatharray = filepath.split(".")
	iconpatharray.remove_at(iconpatharray.size()-1)
	var iconpath : String = "".join(iconpatharray)
	iconpath = iconpath + ".png"
	Events.screenshot($garphwindow/Zoom, iconpath)
	var pos = $garphwindow/Zoom/worldOrigin.position
	var scal = $garphwindow/Zoom.scale.x
	file.store_line("___[cfg]," + String.num(pos.x) + "," + String.num(pos.y) + "," + String.num(scal))
	for node in worldorigin.get_children():
		if !node.has_method("ssave"):
			OS.alert("node " + node.name + " has no method to save error")
			continue
		file.store_line( "___" + node.ssave() )
		pass
	file.close()
	pass

var path
func Fload(_path):
	if get_tree() == null: return
	path = _path
	FloadDelayed()
	pass


func FloadDelayed():
	if get_tree() == null: return
	filepath = path
	loaded = true
	
	var file = FileAccess.open_encrypted_with_pass(filepath,FileAccess.READ,"hehehe")
	if file == null:
		file = FileAccess.open(filepath,FileAccess.READ)
		if file.get_as_text().split("___").size() > 1 : OS.alert("الملف تالف ولكن سيتم محاولة اصلاحه...")
	var FileFtext = file.get_as_text()
	var lines : PackedStringArray = FileFtext.split("___")
	
	for line in lines:
		var colums = line.split(",")
		#load types
		if colums[0] == "[png]": loadpng(colums)
		if colums[0] == "[txt]": loadtxt(colums)
		if colums[0] == "[graph]": loadgraph(colums)
		if colums[0] == "[file]": loadfile(colums)
		if colums[0] == "[arrow]": loadarrow(colums)
		if colums[0] == "[draw]": loaddraw(colums)
		if colums[0] == "[cfg]": loadConfig(colums)
	file.close()
	pass


func loadConfig(arr):
	var _position = Vector2(arr[1].to_float(),arr[2].to_float())
	var _scale = arr[3].to_float()
	$garphwindow/Zoom/worldOrigin.position = _position
	$garphwindow/Zoom.scale = Vector2(_scale, _scale)
	pass


func loadpng(arr : PackedStringArray):
	if arr.size() < 6:
		OS.alert("text file is corrupt")
		return
	var inst = preload("res://MiniWindow/png.tscn").instantiate()
	worldorigin.add_child(inst)
	var _imagepath = arr[5]
	var _position = Vector2(arr[1].to_float() ,arr[2].to_float())
	var _scale = Vector2(arr[3].to_float() ,arr[4].to_float())
	inst.lload(_position,_scale, _imagepath.split("\n")[0])

func loadtxt(arr : PackedStringArray):
	if arr.size() < 16:
		OS.alert("text file is corrupt")
		return
	var inst = preload("res://MiniWindow/txt.tscn").instantiate()
	worldorigin.add_child(inst)
	var _position = Vector2(arr[1].to_float(),arr[2].to_float())
	var _scale = Vector2(arr[3].to_float(),arr[4].to_float())
	var _font_scale = arr[5].to_float()
	var _text_color = Color(arr[6].to_float(),arr[7].to_float(),arr[8].to_float(),arr[9].to_float())
	var _panel_color = Color(arr[10].to_float(),arr[11].to_float(),arr[12].to_float(),arr[13].to_float())
	var _corner_rad = arr[14].to_float()
	var _title = arr[15]
	var _text = arr[16].split("\n")[0].split("\\n")
	inst.lload(_position,_scale,_font_scale,_text_color,_panel_color,_corner_rad,_title,_text)

func loadgraph(arr : PackedStringArray):
	if arr.size() < 6:
		OS.alert("text file is corrupt")
		return
	var inst = preload("res://MiniWindow/png.tscn").instantiate()
	worldorigin.add_child(inst)
	inst.setpath(arr[5])
	inst.position = Vector2(arr[1].to_float() ,arr[2].to_float())
	inst.get_child(0).size = Vector2(arr[3].to_float() ,arr[4].to_float())

func loadfile(arr : PackedStringArray):
	if arr.size() < 6:
		OS.alert("text file is corrupt")
		return
	var inst = preload("res://MiniWindow/png.tscn").instantiate()
	worldorigin.add_child(inst)
	inst.setpath(arr[5])
	inst.position = Vector2(arr[1].to_float() ,arr[2].to_float())
	inst.get_child(0).size = Vector2(arr[3].to_float() ,arr[4].to_float())

func loadarrow(arr : PackedStringArray):
	var inst = preload("res://MiniWindow/arrow.tscn").instantiate()
	worldorigin.add_child(inst)
	var pos = Vector2(arr[1].to_float() ,arr[2].to_float())
	inst.lload(pos,arr)


func loaddraw(arr : PackedStringArray):
	var inst = preload("res://MiniWindow/draw.tscn").instantiate()
	worldorigin.add_child(inst)
	var pos = Vector2(arr[1].to_float() ,arr[2].to_float())
	var _size = Vector2(arr[3].to_float() ,arr[4].to_float())
	inst.lload(pos,_size,arr)
	



func _on_editmode_pressed():
	$garphwindow/Control.visible = Events.editmode
	Events.editmode = !Events.editmode
	$FlowContainer/Panel2/ScrollContainer/BoxContainer/new.visible = Events.editmode
	pass
