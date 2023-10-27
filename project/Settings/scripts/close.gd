extends Button

func close():
	$"../../../..".queue_free()
	pass

func _pressed():
	$"../../..".close()
	$"../../..".on_close.connect(close)
	pass
