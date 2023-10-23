extends Control

var Filename : String = "جدول جديد"
var filemanager : Control

func _on_button_pressed():
	FileAccess.open(filemanager.path + "/" + Filename + ".graph",FileAccess.WRITE).close()
	filemanager.update()
	$Control.close()
	
	$Control.on_close.connect(close)
	pass # Replace with function body.

func close():
	queue_free()
	pass

func _on_line_edit_text_changed(new_text):
	Filename = new_text
	pass # Replace with function body.


func _on_button_2_pressed():
	$Control.close()
	
	$Control.on_close.connect(close)
	pass # Replace with function body.
