extends Label

var isvalid = true

func _process(_delta):
	var path = $"../location/BoxContainer/LineEdit".text
	var projname = $"../name/LineEdit".text
	
	isvalid = DirAccess.dir_exists_absolute(path) && !DirAccess.dir_exists_absolute(path + "/" + projname)
	if isvalid:
		
		text = "لا يوجد اخطاء"
		
	else:
		text = "خطأ: اما الموقع غير صحيح او يوجد مشروع قديم بنفس الاسم"
	pass
