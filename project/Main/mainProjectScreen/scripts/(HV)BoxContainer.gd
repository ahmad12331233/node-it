extends BoxContainer

@export var changeSize = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var _size = get_window().size
	vertical = _size.x < _size.y
	if changeSize:
		if vertical:
			size_flags_stretch_ratio = 4
		else:
			size_flags_stretch_ratio = 2
	pass
