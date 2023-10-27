extends Button


func close():
	$"../../..".queue_free()
	pass


func _pressed():
	Events.saveSettings()
	Events.updatesettings()
	$"../..".close()
	$"../..".on_close.connect(close)
	pass
