extends Control

func addpoint(p):
	get_child(get_child_count()-1).add_point(p)

func newcanvas():
	add_child(Line2D.new())

func getpoints():
	var output = ""
	for a in get_children():
		if a is Line2D:
			if getcurrentpoints(a) == "" : continue
			output += getcurrentpoints(a) + ","
	return output

func getcurrentpoints(line2d):
	var output = ""
	for a in range(line2d.get_point_count()-1):
		output += String.num(line2d.get_point_position(a).x) + "//" + String.num(line2d.get_point_position(a).y) + "NNN"
	return output

var _pressed = false
var firstpos : Vector2
var goalpos : Vector2
func _gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			_pressed = event.is_pressed()
			if _pressed: newcanvas()
			firstpos = event.position
			goalpos = event.position
	
	if event is InputEventMouseMotion && _pressed:
		#get_child(get_child_count()-1).add_point(event.position)
		goalpos = event.position


func _process(_delta):
	if _pressed:
		var line2d = get_child(get_child_count()-1)
		if line2d.get_point_count()-1 < 0: addpoint(firstpos)
		var pos = line2d.get_point_position(line2d.get_point_count()-1)
		var vector = (goalpos - pos) / Events.drawSmoothing
		pos += vector
		line2d.add_point(pos)

