extends Control


var path
var remove
@onready var control = $SubViewport/Control
func screenshot(_node : Node, _path, _size : Vector2 = Vector2(400,400), transparent = false, selfdestroy = false):
	$SubViewport.size = _size
	$SubViewport.transparent_bg = transparent
	$SubViewport/Control.position = _size / 2.0
	remove = selfdestroy
	path = _path
	control.add_child(_node.duplicate())
	get_tree().create_timer(0.1).timeout.connect(DelayedScreenShot)
	pass

func DelayedScreenShot():
	await RenderingServer.frame_post_draw
	var texture : Texture2D = $SubViewport.get_texture()
	texture.get_image().save_png(path)
	if remove:
		queue_free()
	pass
