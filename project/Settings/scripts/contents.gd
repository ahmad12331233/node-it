extends BoxContainer



func _ready():
	for property in Events.get_property_list():
		if property.get("name").split("_")[0] != "s": continue
		var _name = property.get("name")
		var _value = String.num(Events.get(_name))
		var inst = preload("res://Settings/setting.tscn").instantiate()
		inst.setval(_name,_value)
		add_child(inst)

