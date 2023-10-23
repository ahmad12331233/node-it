extends Control

func ssave():
	var pos = String.num(position.x) + "," + String.num(position.y) + ","
	return "[arrow]," + pos + $arrow.getpoints()

func lload(pos : Vector2, arr : PackedStringArray):
	position = pos
	$arrow.loadMode()
	for a in arr:
		if a == arr[0] : continue
		if a == arr[1] : continue
		if a == arr[2] : continue
		var xy = a.split("//")
		if xy.size() < 2 : continue
		$arrow.addpoint(Vector2( xy[0].to_float() , xy[1].to_float()))
		pass
	pass
