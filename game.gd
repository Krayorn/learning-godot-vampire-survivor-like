extends Node

func _ready():
	var manager = get_node("/root/SceneManager")
	manager.init(self)
	#manager.show_scene(manager.insideMapPath)
	manager.show_scene(manager.mainMapPath)
