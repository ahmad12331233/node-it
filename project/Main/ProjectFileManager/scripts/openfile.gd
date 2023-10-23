extends Button


func _pressed():
	#if $"../../.."._str.get_extension() == "png":
	#	var inst = preload("res://draw/draw.tscn").instantiate()
	#	Events.addTab.emit(inst, $"../../.."._str.split(".")[0], $"../../..".path)
	#	if inst == null : return
	#	inst.Fload($"../../..".path + "/" + $"../../.."._str)
	
	if $"../../.."._str.get_extension() == "graph":
		var inst = preload("res://Graph/Graph.tscn").instantiate()
		Events.addTab.emit(inst, $"../../.."._str.split(".")[0], $"../../..".path)
		if inst == null : return
		inst.Fload($"../../..".path + "/" + $"../../.."._str)
	
	pass
