extends Control

func ssave():
	var pos = String.num(position.x) + "," + String.num(position.y) + ","
	var _size = String.num($pngcontainer.size.x) + "," + String.num($pngcontainer.size.y) + ","
	return "[draw]," + pos + _size + $pngcontainer/vectordraw.getpoints()

func lload(_pos : Vector2, _size : Vector2, arr : PackedStringArray):
	position = _pos
	$pngcontainer.size = _size
	for a in arr:
		if a == arr[0] : continue
		if a == arr[1] : continue
		if a == arr[2] : continue
		if a == arr[3] : continue
		if a == arr[4] : continue
		var a_arr = a.split("NNN")
		$pngcontainer/vectordraw.newcanvas()
		for b in a_arr:
			var xy = b.split("//")
			if xy.size() < 2 : continue
			$pngcontainer/vectordraw.addpoint(Vector2( xy[0].to_float() , xy[1].to_float()))
		pass
	pass
