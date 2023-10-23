extends Button

func _pressed():
	var inst = preload("res://Graph/newUI/new.tscn").instantiate()
	inst.name = "aaa"
	$"../../../../..".add_child(inst)
	#$"../../../../../../MultiplayerSpawner2".spawn("res://Graph/newUI/new.tscn")
	pass
