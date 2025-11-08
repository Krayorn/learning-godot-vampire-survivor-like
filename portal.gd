extends Area2D

@export var target_scene_path: String
@export var target_spawn_position: Vector2

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body: Node) -> void:
	if not body.is_in_group("player"):
		return

	var manager := get_node_or_null("/root/SceneManager")
	if not manager:
		print("[Portal] No SceneManager found!")
		return

	# block re-entry
	if not manager.can_teleport:
		print("[Portal] teleport blocked by cooldown")
		return

	manager.can_teleport = false

	print("[Portal] teleporting player via portal ", " -> ", target_scene_path, " pos:", target_spawn_position)

	# Ask manager to show the target scene (this enables it and sets manager.current_scene)
	manager.show_scene(target_scene_path)
	var dest_scene: Node = manager.current_scene
	if not dest_scene:
		print("[Portal] ERROR: target scene not available")
		manager.can_teleport = true
		return

	# Set global position (world coordinates) then reparent preserving global transform
	body.global_position = target_spawn_position
	# Use reparent with keep_global to avoid transform shifts
	body.reparent(dest_scene, true)

	# small delay before allowing teleport again to avoid immediate retrigger
	await get_tree().create_timer(1).timeout
	manager.can_teleport = true
