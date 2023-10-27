extends Control

var movespeed = 1
var stopspeed = 5
var zoomspeed = 1
var scrollAMP = 2.5

var point0 = Vector2()
var point1 = Vector2()
var lengthvec = Vector2()
var length = 0
var length_old = 0
var length_motion = 0
var zooming = false


var acc = Vector2()
var __scroll = false
func _gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.is_pressed():
				__scroll = true
				length_old = length
			if event.is_released():
				__scroll = false
				length_old = length
				acc *= scrollAMP
		
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			$Zoom.scale += Vector2(0.1,0.1)
			pass
		
		if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			$Zoom.scale -= Vector2(0.1,0.1)
			pass
		
	if event is InputEventMouseMotion && __scroll:
		#if Events.smoothscroll:
		#	acc.y += (event.relative.y * 1/$Zoom.scale.y) * movespeed
		#	acc.x += (event.relative.x * 1/$Zoom.scale.x) * movespeed
		#else:
		acc.y = (event.relative.y * 1/$Zoom.scale.y) * movespeed
		acc.x = (event.relative.x * 1/$Zoom.scale.x) * movespeed
	
	if event is InputEventScreenTouch:
		length_old = length
		lengthvec = point0 - point1
		length = sqrt((lengthvec.x * lengthvec.x) + (lengthvec.y * lengthvec.y))
		length_motion = length_old - length
	if event is InputEventScreenDrag:
		if event.index == 0:
			point0.x = event.position.x
			point0.y = event.position.y
		if event.index == 1:
			point1.x = event.position.x
			point1.y = event.position.y
		zooming = event.index >= 1
	pass


func _process(_delta):
	movespeed = Events.s_movespeed
	stopspeed = Events.s_stopspeed
	zoomspeed = Events.s_zoomspeed
	scrollAMP = Events.s_moveamp
	if zooming:
		lengthvec = point0 - point1
		length = sqrt((lengthvec.x * lengthvec.x) + (lengthvec.y * lengthvec.y))
		length_motion = length_old - length
		$Zoom.scale -= Vector2((length_motion / 1000) * zoomspeed ,(length_motion / 1000) * zoomspeed) 
	length_old = length
	
	$Zoom/worldOrigin.position += acc
	acc -= acc * stopspeed * _delta
	
	if __scroll == true:
		acc = 0.4 * acc
	
	pass
