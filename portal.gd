extends Area2D

@export var target_scene_path: String
@export var target_spawn_position: Vector2

@onready var game = get_node("/root/Game")

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body: Node) -> void:	
	if not body.is_in_group("player"):
		return

	print("[Portal] teleporting player via portal ", " -> ", target_scene_path, " pos:", target_spawn_position)


	var dest_scene = game.move_to(target_scene_path)
	body.global_position = target_spawn_position
	body.reparent(dest_scene, true)
