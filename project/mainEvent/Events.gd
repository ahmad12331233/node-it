extends Node

signal addTab(tab,name,path)
signal removeTab(index)
signal addtoscreen(instance)

func text_popup(_text : String, _title : String = "Popup"):
	var inst = preload("res://popup/Text_popup.tscn").instantiate()
	addtoscreen.emit(inst)
	return inst

func screenshot(node : Node ,path : String, _size : Vector2 = Vector2(1500,1500) , transparent = false):
	var inst = preload("res://screenshot/screenshot.tscn").instantiate()
	get_tree().root.add_child(inst)
	inst.screenshot(node,path,_size, transparent,true)
	pass

func OpenProject(_path : String):
	projectpath = _path
	isProjectOpen = true
	pass
func NewProject(_path : String):
	isProjectOpen = true
	pass

var projectpath : String
var isProjectOpen = false
var fullscreen = false
var movespeed = 1
var smoothscroll = false
var showXY = true
var drawSmoothing = 3
var editmode = false

