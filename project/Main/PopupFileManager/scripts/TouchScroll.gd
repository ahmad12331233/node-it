extends ScrollContainer

var movespeed = 1
var stopspeed = 1.5
var zoomspeed = 1
var scrollAMP = 1.5

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
				acc *= scrollAMP
	if event is InputEventMouseMotion && __scroll:
		if Events.smoothscroll:
			acc.y += event.relative.y * movespeed
			acc.x += event.relative.x * movespeed
		else:
			acc.y = event.relative.y * movespeed
			acc.x = event.relative.x * movespeed
		accept_event()


func _process(_delta):
	movespeed = Events.movespeed
	scroll_vertical -= acc.y
	acc -= acc * stopspeed * _delta
	if __scroll == true && !Events.smoothscroll:
		acc = 0.3 * acc
	
	pass
