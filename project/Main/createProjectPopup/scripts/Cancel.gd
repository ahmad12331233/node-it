extends Button


func _pressed():
	$"../../../..".close()


func _on_control_on_close():
	owner.queue_free()
	pass # Replace with function body.
