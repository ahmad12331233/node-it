extends Button


func _on_button_down():
	oldmousepos = owner.get_parent().get_parent().get_local_mouse_position()
	pass # Replace with function body.
	

var oldmousepos
var newmousepos
func _pressed():
	newmousepos =  owner.get_parent().get_parent().get_local_mouse_position()
	if !(oldmousepos - newmousepos > Vector2(-1,-1) && oldmousepos - newmousepos < Vector2(1,1)): return
	$"../../..".control.selected(text)
	
	pass


