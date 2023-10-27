extends Control

func ssave():
	var output : String = ""
	output += "[txt],"
	output += String.num(position.x) + ","
	output += String.num(position.y) + ","
	output += String.num(buttonpanel.size.x) + ","
	output += String.num(buttonpanel.size.y) + ","
	output += String.num(textedit.get_theme_font_size("font_size")) + ","
	output += String.num(textedit.get_theme_color("font_color").r) + ","
	output += String.num(textedit.get_theme_color("font_color").g) + ","
	output += String.num(textedit.get_theme_color("font_color").b) + ","
	output += String.num(textedit.get_theme_color("font_color").a) + ","
	output += String.num(panel.get_theme_stylebox("panel").bg_color.r) + ","
	output += String.num(panel.get_theme_stylebox("panel").bg_color.g) + ","
	output += String.num(panel.get_theme_stylebox("panel").bg_color.b) + ","
	output += String.num(panel.get_theme_stylebox("panel").bg_color.a) + ","
	output += String.num(panel.get_theme_stylebox("panel").corner_radius_bottom_left) + ","
	output += $buttonpanel/move.text + ","
	var arr = textedit.text.split("\n")
	var string = ""
	for a in range(arr.size()):
		if a >= arr.size()-1 :
			string += arr[a]
			continue
		string += arr[a] + "\\n"
	output += string
	return output

@export var panel : Panel
@export var textedit : TextEdit
@export var buttonpanel : Button
func lload(_position,_scale,_fontsscale,_textcolor,_panelcolor,_corner_rad,_title,_text):
	$buttonpanel/move.text = _title
	position = _position
	buttonpanel.size = _scale
	for a in range(_text.size()):
		if a >= _text.size() - 1:
			textedit.text += _text[a]
			continue
		textedit.text += _text[a] + "\n"
	textedit.add_theme_font_size_override("font_size",_fontsscale)
	textedit.add_theme_color_override("font_color",_textcolor)
	var stylebox = StyleBoxFlat.new()
	stylebox.bg_color = _panelcolor
	color = _panelcolor
	stylebox.corner_radius_bottom_left = _corner_rad
	stylebox.corner_radius_bottom_right = _corner_rad
	stylebox.corner_radius_top_left = _corner_rad
	stylebox.corner_radius_top_right = _corner_rad
	corner_rad = _corner_rad
	panel.add_theme_stylebox_override("panel",stylebox)


func _process(_delta):
	get_node("buttonpanel/settings/Panel/SpinBox").value = textedit.get_theme_font_size("font_size")
	#get_node("buttonpanel/settings/Panel/SpinBox2").value = corner_rad
	pass

func _on_color_picker_button_color_changed(_color):
	textedit.add_theme_color_override("font_color",_color)



func _on_spin_box_value_changed(value):
	textedit.add_theme_font_size_override("font_size",value)


var corner_rad = 10
var color = Color()
func _on_panel_color_picker_button_color_changed(_color):
	var a = StyleBoxFlat.new()
	a.bg_color = _color
	color = _color
	a.corner_radius_bottom_left = corner_rad
	a.corner_radius_bottom_right = corner_rad
	a.corner_radius_top_left = corner_rad
	a.corner_radius_top_right = corner_rad
	panel.add_theme_stylebox_override("panel",a)


func _on_spin_box_2_value_changed(value):
	corner_rad = value
	var a = StyleBoxFlat.new()
	a.bg_color = color
	a.corner_radius_bottom_left = corner_rad
	a.corner_radius_bottom_right = corner_rad
	a.corner_radius_top_left = corner_rad
	a.corner_radius_top_right = corner_rad
	panel.add_theme_stylebox_override("panel",a)



func _on_line_edit_text_changed(new_text):
	$buttonpanel/move.text = new_text
	pass # Replace with function body.
