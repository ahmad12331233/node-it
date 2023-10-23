extends HSlider



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	value = Events.movespeed
	pass


func _on_value_changed(_value):
	Events.movespeed = value
	pass # Replace with function body.
