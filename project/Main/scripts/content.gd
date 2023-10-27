extends TabContainer

@onready var tabbar = $"../tabs/TabBar"
	



func add(WindowInstance , WindowName = ""):
	if WindowName == "":
		WindowInstance.name = "MyGraph" + String.num(get_child_count() + 1)
	else:
		WindowInstance.name = WindowName
	add_child(WindowInstance)
	tabbar.add_tab(WindowInstance.name)
	current_tab = get_tab_count() - 1
	tabbar.current_tab = get_tab_count() - 1
	pass

func remove(tab : int):
	if get_child(tab) == null : return
	get_child(tab).queue_free()
	tabbar.remove_tab(tab)

func current(tab : int):
	current_tab = tab
	tabbar.current_tab = tab
