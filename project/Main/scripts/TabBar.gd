extends TabBar
@onready var content = $"../../content"

func _on_tab_selected(tab):
	content.current_tab = tab
	pass # Replace with function body.


func _on_tab_close_pressed(tab):
	content.get_child(tab).queue_free()
	remove_tab(tab)
	pass # Replace with function body.
