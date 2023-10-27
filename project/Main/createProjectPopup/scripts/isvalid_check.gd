extends Label

var isvalid = true

func _process(_delta):
	var path = $"../location/BoxContainer/LineEdit".text
	var projname = $"../name/LineEdit".text
	
	isvalid = DirAccess.dir_exists_absolute(path) && !DirAccess.dir_exists_absolute(path + "/" + projname)
	if isvalid:
		
		text = "no errors"
		
	else:
		text = "error change the name or path"
	pass
