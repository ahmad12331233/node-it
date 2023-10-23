extends TextureRect

var Fdraw = false
func _gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			Fdraw = true
			oldPos = newpos
		elif event.is_released():
			Fdraw = false
			oldPos = newpos

var Draw_size = 10
var oldPos
var newpos
func _process(_delta):
	if !Fdraw: return
	var img = texture.get_image()
	var pos_UN_Modified : Vector2 = get_local_mouse_position()
	var rect_Size : Vector2 = size
	var pic_size : Vector2 = texture.get_image().get_size()
	var amount : Vector2 = pic_size / rect_Size
	var pos : Vector2 = pos_UN_Modified * amount
	newpos = pos
	for i in range(-Draw_size, Draw_size):
		for j in range(-Draw_size, Draw_size):
			if pos.x + i < 0 || pos.x + i >= img.get_size().x: continue
			if pos.y + j < 0 || pos.y + j >= img.get_size().y: continue
			img.set_pixel( int(pos.x + i), int(pos.y + j), Color.BLACK)
	
	texture = ImageTexture.create_from_image(img)
	oldPos = pos
	
