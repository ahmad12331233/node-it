extends BoxContainer



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var _size = get_window().get_size_with_decorations()
	vertical = _size.x < _size.y
	pass
