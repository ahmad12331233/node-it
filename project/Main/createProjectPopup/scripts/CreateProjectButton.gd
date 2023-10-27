extends Button

func _ready():
	if DirAccess.dir_exists_absolute("/sdcard"):
		if DirAccess.make_dir_recursive_absolute("/sdcard/projects") != OK:
			print("DirError /sdcard/projects does not exist")
	pass

func close():
	owner.queue_free()
	pass

func _pressed():
	var projname = $"../../Control/ProjStat/name/LineEdit".text
	var projpath = $"../../Control/ProjStat/location/BoxContainer/LineEdit".text
	
	if $"../../Control/ProjStat/Label".isvalid:
		
		var error = DirAccess.make_dir_recursive_absolute(projpath + "/" + projname)
		if error == OK:
			FileAccess.open(projpath + "/" + projname + "/" + "project.proj",FileAccess.WRITE)
			Events.NewProject(projpath + "/" + projname + "/" + "project.proj")
			
			$"../../../..".close()
			$"../../../..".on_close.connect(close)
	pass
