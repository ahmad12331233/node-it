extends Control

var _min = 0.25
var _max = 2
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if scale.x < _min:
		scale.x = _min
	if scale.y < _min:
		scale.y = _min
		
	if scale.x > _max:
		scale.x = _max
	if scale.y > _max:
		scale.y = _max
	
	pass
