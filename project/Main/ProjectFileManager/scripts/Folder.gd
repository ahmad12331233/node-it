extends Control

var _str : String
var path : String
var control : Control

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$Control/BoxContainer/button.text = _str
	pass

func _on_button_pressed():
	control.path = path + "/" + _str
	control.update()
	pass # Replace with function body.
