extends Control

@onready var content = $window/windowBackpanel/windowholder/MainVbox/SplitContainer/SplitContainer/contentBackpanel/contentclip/content
@onready var tabs = $window/windowBackpanel/windowholder/MainVbox/SplitContainer/SplitContainer/contentBackpanel/contentclip/tabs/TabBar

func _ready():
	Events.addTab.connect(addTab)
	Events.addtoscreen.connect(_addtoscreen)
	Events.main = self
	pass

func _addtoscreen(inst):
	add_child(inst)
	pass



func closeWelcomeScreen():
	$window/windowBackpanel/windowholder/MainVbox/SplitContainer/SplitContainer/contentBackpanel/contentclip/content.remove(0)
	pass


func updatefilemanager():
	Events.updateFileManagers.emit(true)
	pass

func addTab(_tab,_name,_path):
	for a in range(tabs.tab_count):
		if tabs.get_tab_title(a) == _name:
			_tab.queue_free()
			return
	content.add(_tab,_name)
	pass
