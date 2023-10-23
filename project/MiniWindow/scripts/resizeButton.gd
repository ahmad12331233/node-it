extends Button


var drag = false
@export var movenode : Control
@export var mainNode : Control

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if drag:
		movenode.size = mainNode.get_local_mouse_position() - movenode.position
	pass


func _on_button_down():
	drag = true
	pass # Replace with function body.


func _on_button_up():
	drag = false
	pass # Replace with function body.
