extends Control

var _str : String
var path : String
var control : Control
# Called when the node enters the scene tree for the first time.


var drag = false
var inst : Control

func _ready():
	get_tree().create_timer(0.3).timeout.connect(delayedready)

func delayedready():
	if Events.projectpath == "": return
	var parts = _str.split(".")
	if parts.size() > 0:
		parts.remove_at(parts.size() - 1)
	var string = ""
	for part in parts:
		string += part + "."
	string += "png"
	var image = Image.new()
	if !FileAccess.file_exists(path + "/" + string): return
	image.load(path + "/" + string)
	var tex = ImageTexture.create_from_image(image)
	$Control/BoxContainer/Control/Panel/TextureRect.texture = tex
	pass


func _process(_delta):
	$Control/BoxContainer/Control/Panel/button.text = _str.split(".")[0]
	if drag:
		var win = control.window.get_current_tab_control().worldorigin
		var a = inst as Control
		a.position = win.get_local_mouse_position()
	pass


func _on_button_2_button_down():
	var win = control.window.get_current_tab_control().worldorigin
	if !FileAccess.file_exists("res://MiniWindow/" + _str.get_extension() + ".tscn"): return
	inst  = load("res://MiniWindow/" + _str.get_extension() + ".tscn").instantiate()
	if inst == null: return
	win.add_child(inst)
	if inst.has_method("setpath"):
		inst.setpath(path + "/" + _str)
	drag = true



func _on_button_2_button_up():
	drag = false
	pass # Replace with function body.
