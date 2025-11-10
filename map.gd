extends Node2D

func _ready() -> void:
	get_node("gameover").visible = false
	var player = get_node("/root/Player")
	player.death.connect(_on_death)
	
func _on_death():
	%gameover.visible = true
	get_tree().paused = true
	
func spawn_mob():
	var new_mob = preload("res://mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)


func _on_timer_timeout() -> void:
	# check a set number, then level up ?
	spawn_mob()
