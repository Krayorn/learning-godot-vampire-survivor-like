extends Area2D

var idle = true

func _physics_process(delta: float) -> void:
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		idle = false
		var target = enemies_in_range[0]
		look_at(target.global_position)
	else:
		idle = true
		


func shoot() -> void:
	const BULLET = preload("res://bullet.tscn")
	var newBullet = BULLET.instantiate()
	newBullet.global_position = %shootingpoint.global_position
	newBullet.global_rotation = %shootingpoint.global_rotation
	%shootingpoint.add_child(newBullet)


func _on_timer_timeout() -> void:
	if !idle:
		shoot()
