extends CharacterBody2D

func _ready():
	add_to_group("player")
	global_position = Vector2(450, 450)  # or wherever your spawn point is

func _physics_process(_delta: float) -> void:
	var direction = Input.get_vector("left", "right", "top", "down")
	
	velocity = direction * 600
	
	move_and_slide()
