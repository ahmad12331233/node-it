extends Control

var path

func setpath(_path):
	$pngcontainer/draw.Fload(_path)
	path = _path
	pass

func ssave():
	var output : String = ""
	output += "[png],"
	output += String.num(position.x) + ","
	output += String.num(position.y) + ","
	output += String.num($pngcontainer.size.x) + ","
	output += String.num($pngcontainer.size.y) + ","
	output += path
	$pngcontainer/draw.Fsave()
	return output

@export var scalepanel : Control
func lload(_position,_scale,pngpath):
	setpath(pngpath)
	position = _position
	scalepanel.size = _scale
	if _scale == Vector2(0,0):
		var image = Image.new()
		image.load(pngpath)
		scalepanel.size = image.get_size()
	pass
