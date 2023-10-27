extends HSlider

func _ready():
	value = 0

func _on_drag_ended(_value_changed):
	$"..".value += value
	Events.set($"..".__name, $"..".value)
	Events.updatesettings()
	value = 0
	pass # Replace with function body.
