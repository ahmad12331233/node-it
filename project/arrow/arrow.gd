extends Control

func loadMode():
	mouse_filter = Control.MOUSE_FILTER_IGNORE

func addpoint(p):
	$Line2D.add_point(p)

func getpoints():
	var output = ""
	for a in range($Line2D.get_point_count()):
		output += String.num($Line2D.get_point_position(a).x) + "//" + String.num($Line2D.get_point_position(a).y) + ","
	return output

var edit = true
var _pressed = false
var _pressed_old = false
var firstpos : Vector2
var goalpos : Vector2
func _gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			_pressed = event.is_pressed()
			firstpos = event.position
			goalpos = event.position
	
	if event is InputEventMouseMotion && _pressed:
		goalpos = event.position

func _process(_delta):
	if !_pressed && _pressed_old:
		mouse_filter = Control.MOUSE_FILTER_IGNORE
	if _pressed:
		var line2d = $Line2D
		if line2d.get_point_count()-1 < 0: addpoint(firstpos)
		var pos = line2d.get_point_position(line2d.get_point_count()-1)
		var vector = (goalpos - pos) / Events.drawSmoothing
		pos += vector
		line2d.add_point(pos)
	_pressed_old = _pressed


func _on_button_pressed():
	get_parent().queue_free()
	pass
