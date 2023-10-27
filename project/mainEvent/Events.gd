extends Node

var main : Control

## add new tab
signal addTab(tab,name,path)
##remove tab
signal removeTab(index)
## add instance to screen
signal addtoscreen(instance)
## update all file managers
signal updateFileManagers(updatepath : bool)

## doesntwork
func text_popup(_text : String, _title : String = "Popup"):
	var inst = preload("res://popup/Text_popup.tscn").instantiate()
	addtoscreen.emit(inst)
	return inst

## screenshot a nodetree and save to a path
func screenshot(node : Node ,path : String, _size : Vector2 = Vector2(1500,1500) , transparent = false):
	var inst = preload("res://screenshot/screenshot.tscn").instantiate()
	get_tree().root.add_child(inst)
	inst.screenshot(node,path,_size, transparent,true)
	pass

func getFolder(filepath):
	var __path = filepath.split("/")
	__path.remove_at(__path.size() - 1)
	var STRreturn = "/"
	for a in __path:
		STRreturn = STRreturn.path_join(a)
	return STRreturn

## open a project
func OpenProject(_path : String):
	projectfile = _path
	projectpath = getFolder(_path)
	main.closeWelcomeScreen()
	isProjectOpen = true
	Events.updateFileManagers.emit(true)
	pass

## create a project
func NewProject(_path : String):
	projectfile = _path
	projectpath = getFolder(_path)
	main.closeWelcomeScreen()
	isProjectOpen = true
	Events.updateFileManagers.emit(true)
	pass

func updatesettings():
	load_def()
	pass

## load or update defaults of the program settings
func load_def():
	get_window().content_scale_factor = s_uiscale
	pass

## load settings
func _ready():
	## used for android runtile permissions
	OS.request_permissions()
	
	var settingsfile = FileAccess.open("user://settings.s",FileAccess.READ)
	if settingsfile == null:
		saveSettings()
		settingsfile = FileAccess.open("user://settings.s",FileAccess.READ)
	var lines = settingsfile.get_as_text().split("\n")
	for line in lines:
		var col = line.split("=")
		if not col.size() > 1: continue
		var settingName = col[0]
		var settingValue = col[1].to_float()
		set(settingName,settingValue)
	load_def()
	pass

##save settings
func saveSettings():
	var settingsfile = FileAccess.open("user://settings.s",FileAccess.WRITE)
	for property in get_property_list():
		if property.get("name").split("_")[0] != "s": continue
		var value = String.num(get(property.get("name")))
		settingsfile.store_string(property.get("name") + "=" + value + "\n")
	pass

#settings
var s_uiscale = 1
var s_movespeed = 1
var s_moveamp = 2
var s_stopspeed = 5
var s_zoomspeed = 1

#project
var projectpath : String
var isProjectOpen = false
var projectfile : String


var fullscreen = false
var showXY = true
var drawSmoothing = 3
var editmode = false

