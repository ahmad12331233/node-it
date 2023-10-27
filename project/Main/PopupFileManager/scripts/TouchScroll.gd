extends ScrollContainer

var acc = Vector2()
var __scroll = false

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.is_pressed():
				__scroll = true
			if event.is_released():
				__scroll = false
				#if !(acc < Vector2(5,5) && acc > Vector2(-5,-5)):
				acc *= Events.s_moveamp
	if event is InputEventMouseMotion && __scroll:
		#if Events.smoothscroll:
		#	acc.y += event.relative.y * movespeed
		#	acc.x += event.relative.x * movespeed
		#else:
		acc.y = event.relative.y * Events.s_movespeed
		acc.x = event.relative.x * Events.s_movespeed
		accept_event()


func _process(_delta):
	scroll_vertical -= acc.y
	acc -= acc * Events.s_movespeed * _delta
	if __scroll == true:
		acc = 0.4 * acc
	pass
