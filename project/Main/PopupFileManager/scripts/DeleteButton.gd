extends Button

func _pressed():
	var path = $"../../..".path + "/" + $"../../.."._str
	OS.move_to_trash(path)
	$"../../..".control.update()
	pass
