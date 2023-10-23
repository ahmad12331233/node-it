extends Control

signal on_close()

func done():
	on_close.emit()
	pass

func close():
	$AnimationPlayer.play("close")
	get_tree().create_timer(0.1).timeout.connect(done)
	pass
