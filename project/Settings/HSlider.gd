extends HSlider

func _ready():
	value = 0

func _on_drag_ended(_value_changed):
	get_window().content_scale_factor += value
	value = 0
	pass # Replace with function body.
