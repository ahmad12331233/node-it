extends Label


var time = 0
func _process(delta):
	if visible_ratio >= 1: return
	time += delta
	if time > .04:
		time = 0
		visible_ratio += 0.03
	
