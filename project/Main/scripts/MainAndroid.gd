extends Control

@onready var content = $window/windowBackpanel/windowholder/MainVbox/SplitContainer/SplitContainer/contentBackpanel/contentclip/content
@onready var tabs = $window/windowBackpanel/windowholder/MainVbox/SplitContainer/SplitContainer/contentBackpanel/contentclip/tabs/TabBar
var ProjectFile : String
var ProjectPath : String
var isprojOpen = false

func _ready():
	OS.request_permissions()
	Events.addTab.connect(addTab)
	Events.addtoscreen.connect(_addtoscreen)
	pass

func _addtoscreen(inst):
	add_child(inst)
	pass

func updatePath():
	var path = ProjectFile.split("/")
	path.remove_at(path.size() - 1)
	ProjectPath = "/"
	for a in path:
		ProjectPath = ProjectPath.path_join(a)
	pass

func closeWelcomeScreen():
	$window/windowBackpanel/windowholder/MainVbox/SplitContainer/SplitContainer/contentBackpanel/contentclip/content.remove(0)
	pass

func newproj():
	closeWelcomeScreen()
	updatePath()
	isprojOpen = true
	updatefilemanager()
	pass

func openproj():
	closeWelcomeScreen()
	updatePath()
	isprojOpen = true
	updatefilemanager()
	pass

func updatefilemanager():
	var filemanagerH = $window/windowBackpanel/windowholder/MainVbox/SplitContainer/SplitContainer/fileWindowH/filewinclip/ProjectFileManager
	var filemanagerV = $window/windowBackpanel/windowholder/MainVbox/SplitContainer/fileWindowV/filewinclip/ProjectFileManager
	filemanagerV.updatepath()
	filemanagerV.update()
	filemanagerH.updatepath()
	filemanagerH.update()
	pass

func addTab(_tab,_name,_path):
	for a in range(tabs.tab_count):
		if tabs.get_tab_title(a) == _name:
			_tab.queue_free()
			return
	
	content.add(_tab,_name)
	pass
