extends Control

var movespeed = 1
var stopspeed = 5
var zoomspeed = 1
var scrollAMP = 2.5

var __scroll = false
var acc = Vector2()

func _gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.is_pressed():
				__scroll = true
			if event.is_released():
				__scroll = false
				acc *= scrollAMP
	
	if event is InputEventMouseMotion && __scroll:
		#if Events.smoothscroll:
		#	acc.y += (event.relative.y * 1/$"../Zoom".scale.y) * movespeed
		#	acc.x += (event.relative.x * 1/$"../Zoom".scale.x) * movespeed
		#else:
		acc.y = (event.relative.y * 1/$"../Zoom".scale.y) * movespeed
		acc.x = (event.relative.x * 1/$"../Zoom".scale.x) * movespeed
	
	

func _process(_delta):
	movespeed = Events.s_movespeed
	stopspeed = Events.s_stopspeed
	zoomspeed = Events.s_zoomspeed
	scrollAMP = Events.s_moveamp
	
	$"../Zoom/worldOrigin".position += acc
	$"../Zoom/Line2D".position += acc
	acc -= acc * stopspeed * _delta
	if __scroll == true:
		acc = 0.4 * acc
	
