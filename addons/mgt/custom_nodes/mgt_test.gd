tool
extends Node

func _enter_tree():
	var new_node = Node.new()
	new_node.set_name("TestChild")

	add_child(new_node)
	new_node.set_owner(get_tree().get_edited_scene_root())
	pass

func _ready():
	pass

func _process(delta):
	pass
