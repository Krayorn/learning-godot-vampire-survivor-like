extends Node

const mainMapPath = "res://map.tscn"
const insideMapPath = "res://inside.tscn"


func _ready():
	get_tree().change_scene_to_file(mainMapPath)

func move_to(path):
	if path == mainMapPath:
		print("REMOVE INSIDE, ADD MAIN")	
		get_tree().change_scene_to_file(mainMapPath)
	else:
		print("REMOVE MAIN, ADD INSIDE")
		get_tree().change_scene_to_file(insideMapPath)
	
	return get_tree().current_scene
