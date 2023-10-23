extends VSlider


func _process(_delta):
	value = $"../../../garphwindow/Zoom".scale.x * 10
	pass

func _on_value_changed(_value):
	$"../../../garphwindow/Zoom".scale = Vector2(_value/10, _value/10)
	pass # Replace with function body.
