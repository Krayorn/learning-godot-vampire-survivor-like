extends CharacterBody2D
class_name PlayerCharacter

@onready var hud = get_node("/root/Hud")

signal death
var health := 100.0

func _ready():
	add_to_group("player")
	global_position = Vector2(450, 450)
	%HealthBar.value = health

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("left", "right", "top", "down")
	
	velocity = direction * 600
	
	move_and_slide()
	
	var overlapping_mobs = %hurtbox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= overlapping_mobs.size() * 10 * delta
		%HealthBar.value = health
		if health <= 0:
			death.emit()

func heal(value):
	health += value
	%HealthBar.value = health

func increase_damage(value):
	$Weapon.damage += value

func increase_rof(value):
	$Weapon.update_rof(value)


func registerMobKill() -> void:
	hud.gain_gold(5)
