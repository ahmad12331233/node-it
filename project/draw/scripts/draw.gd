extends Control

var path
func Fload(_path):
	var image = Image.new()
	image.load(_path)
	$TextureRect.texture = ImageTexture.create_from_image(image)
	path = _path
	pass

func Fsave():
	var img : Image = $TextureRect.texture.get_image()
	img.save_png(path)
	pass

func _on_button_pressed():
	Fsave()
	pass
