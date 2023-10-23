extends Control


@export var _first = false
func _process(_delta):
	if ! $"../Line2D".get_point_count() > 0: return
	if _first:
		position = $"../Line2D".get_point_position($"../Line2D".get_point_count() - 1)
	else:
		position = $"../Line2D".get_point_position(0)
	pass
