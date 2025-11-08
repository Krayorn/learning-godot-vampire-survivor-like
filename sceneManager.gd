# SceneManager.gd
extends Node

var current_scene: Node = null
var maps := {}
var can_teleport: bool = true

const mainMapPath = "res://map.tscn"
const insideMapPath = "res://inside.tscn"

func init(parent: Node) -> void:
	if maps.size() == 0:
		var main = load(mainMapPath).instantiate()
		# start disabled; Game will call show_scene to enable
		main.visible = false
		main.process_mode = Node.PROCESS_MODE_DISABLED
		_disable_canvas_layers_recursive(main)
		parent.add_child(main)
		maps[mainMapPath] = main

		var inside = load(insideMapPath).instantiate()
		inside.visible = false
		inside.process_mode = Node.PROCESS_MODE_DISABLED
		_disable_canvas_layers_recursive(inside)
		parent.add_child(inside)
		maps[insideMapPath] = inside

func show_scene(path: String) -> void:
	# debug
	print("[SceneManager] show_scene(", path, ")")
	if current_scene:
		# fully disable old scene
		current_scene.visible = false
		current_scene.process_mode = Node.PROCESS_MODE_DISABLED
		_disable_canvas_layers_recursive(current_scene)

	var new_scene: Node = maps.get(path, null)
	if new_scene:
		new_scene.visible = true
		# let nodes inherit normal processing mode
		new_scene.process_mode = Node.PROCESS_MODE_INHERIT
		_enable_canvas_layers_recursive(new_scene)
		current_scene = new_scene
	else:
		print("[SceneManager] WARNING: scene not found for path:", path)

# recursively toggle CanvasLayer nodes in the whole subtree
func _disable_canvas_layers_recursive(node: Node) -> void:
	if node is CanvasLayer:
		node.visible = false
	for child in node.get_children():
		_disable_canvas_layers_recursive(child)

func _enable_canvas_layers_recursive(node: Node) -> void:
	if node is CanvasLayer:
		node.visible = true
	for child in node.get_children():
		_enable_canvas_layers_recursive(child)
