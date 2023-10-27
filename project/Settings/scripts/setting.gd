extends BoxContainer

var __name = ""
var value = 0
func setval(_name : String ,_value : String):
	var splitName = _name.split("_")
	var a = splitName[splitName.size() - 1]
	$text.text = a
	$val.text = _value
	value = _value.to_float()
	__name = _name
	pass

func _process(_delta):
	$val.text = String.num(value)
