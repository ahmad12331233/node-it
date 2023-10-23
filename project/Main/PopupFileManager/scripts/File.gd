extends Control

var _str : String
var path : String
var control : Control
# Called when the node enters the scene tree for the first time.

func _process(_delta):
	$Control/BoxContainer/button.text = _str
