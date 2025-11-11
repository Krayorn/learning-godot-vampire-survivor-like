extends CharacterBody2D

@onready var player: PlayerCharacter = get_node("/root/Player")

var health = 3

func _physics_process(_delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 200
	move_and_slide()

func take_damage(dmg):
	health -= dmg
	if health <= 0:
		player.registerMobKill()
		queue_free()
