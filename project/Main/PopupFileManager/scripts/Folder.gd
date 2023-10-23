extends Control

var _str : String
var path : String
var control : Control

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	

	$Control/BoxContainer/button.text = _str
	pass


var oldmousepos
var newmousepos


func _on_button_pressed():
	newmousepos = get_parent().get_parent().get_local_mouse_position()
	if !(oldmousepos - newmousepos > Vector2(-1,-1) && oldmousepos - newmousepos < Vector2(1,1)): return
	control.path = path + "/" + _str
	control.update()
	pass # Replace with function body.


func _on_button_button_down():
	oldmousepos = get_parent().get_parent().get_local_mouse_position()
	pass # Replace with function body.
