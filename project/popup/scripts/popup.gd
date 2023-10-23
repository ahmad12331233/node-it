extends Control

signal on_cancel()
signal on_accept(_Text : String)

#accept
func _on_button_pressed():
	var _text = $Control/window/pathPanel/BoxContainer2/LineEdit.text
	on_accept.emit(_text)
	$Control.close()
	pass

#cancel
func _on_button_2_pressed():
	on_cancel.emit()
	$Control.close()
	pass

func _on_control_on_close():
	queue_free()
	pass # Replace with function body.
