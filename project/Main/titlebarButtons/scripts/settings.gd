extends Button


func _pressed():
	get_tree().root.add_child(preload("res://Settings/settingsui.tscn").instantiate())
	pass
