extends Button

var drag = false
var down = false
var startpos

@export var movenode : Control
@export var mainNode : Control


var timer = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(_delta):
#	if down:
#		timer += _delta
#		if timer > 1:
#			var endpos = $"..".get_parent().position #mainNode.get_parent().get_local_mouse_position()
#			timer = 0
#			if startpos - endpos < Vector2(5,5) && startpos - endpos > Vector2(-5,-5):
#				
#				down = false
#				drag = true
#				mainNode.get_parent().parent.__scroll = false
#			else:
#				down = false
#	if drag:
#		movenode.position = mainNode.get_parent().get_local_mouse_position() - position - (size/2)
#	pass


#func _on_button_down():
#	startpos =  $"..".get_parent().position #mainNode.get_parent().get_local_mouse_position()
#	down = true
#	pass # Replace with function body.


#func _on_button_up():
#	down = false
#	drag = false
#	pass # Replace with function body.

func _process(_delta):
	if drag:
		$"..".position = $"..".get_parent().get_local_mouse_position() - Vector2($".".size.x / 2, 10)
		pass
	pass

func _on_move_button_down():
	drag = true
	pass # Replace with function body.


func _on_move_button_up():
	drag = false
	pass # Replace with function body.
