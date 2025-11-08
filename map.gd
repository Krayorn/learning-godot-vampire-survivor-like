extends Node2D

func _ready():
	var player = get_node("/root/Player")
	add_child(player) 
	
