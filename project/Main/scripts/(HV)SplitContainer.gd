extends SplitContainer

var newsize
var oldsize


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	newsize = get_window().get_size_with_decorations()
	if !Events.fullscreen && Events.isProjectOpen:
		var asize = get_window().get_size_with_decorations()
		if asize.x > size.y:
			$SplitContainer/fileWindowH.visible = true
			$fileWindowV.visible = false
		else:
			$SplitContainer/fileWindowH.visible = false
			$fileWindowV.visible = true
	else:
		$fileWindowV.visible = false
		$SplitContainer/fileWindowH.visible = false
	
	if newsize != oldsize:
		$SplitContainer/fileWindowH/filewinclip/ProjectFileManager.update()
		$fileWindowV/filewinclip/ProjectFileManager.update()
	oldsize = get_window().get_size_with_decorations()
