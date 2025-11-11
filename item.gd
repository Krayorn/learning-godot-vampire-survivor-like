extends StaticBody2D

@onready var player: PlayerCharacter = get_node("/root/Player")
@onready var hud = get_node("/root/Hud")

@export var cost: int
@export var value: float

@export var description: String
@export var kind: String

func _ready() -> void:
	$Cost.text = str(cost)
	$Utility.text = description

func _on_button_pressed() -> void:
	if hud.gold < cost:
		return
	
	hud.spend_gold(cost)
	
	if kind == "heal":
		player.heal(value)

	if kind == "damage":
		player.increase_damage(value)
		
	if kind == "rate_of_fire":
		player.increase_rof(value)
