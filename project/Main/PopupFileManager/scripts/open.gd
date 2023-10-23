extends Button

func _pressed():
	if owner.openfolder:
		owner.File_selected.emit(owner.path)
		
		get_tree().create_timer(0.1).timeout.connect(Nhide)
		owner.find_child("AnimationPlayer").play("close")
		pass
	pass


func Nhide():
	owner.queue_free()
	pass
