extends Area2D

var SPEED = 1000 

var travelled = 0

func _physics_process(delta: float) -> void:
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * SPEED * delta
	
	travelled += SPEED * delta
	if travelled >= 1500:
		queue_free()



func _on_body_entered(body: Node2D) -> void:
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()
