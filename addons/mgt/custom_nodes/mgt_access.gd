tool
extends Node2D

onready var MAP = get_node("/root/Main/MapSystem") if not Engine.is_editor_hint() else null

export(String) var destination_sector_name
export(String) var destination_access_name

func _ready():
	if Engine.is_editor_hint(): return

	MAP = get_node("/root/Main/MapSystem")
	if $Area:
		$Area.connect("body_entered", self, "_on_Access_body_entered")

	if MAP.access_name == get_name():
		get_tree().call_group("can_trigger_access", "set_global_position", $Point.get_global_position())
		pass

func _on_Access_body_entered(body):
	if Engine.is_editor_hint(): return
	
	if body.is_in_group("can_trigger_access"):
		MAP.goes_through_access(self)
		pass
	pass

func init_on_editor():
	var Access = preload("Access.tscn").instance()

	var new_node
	if not has_node("Area"):
		new_node = Access.get_node("Area").duplicate()
		new_node.set_name("Area")

		call_deferred("add_child", new_node)
		new_node.call_deferred("set_owner", get_tree().get_edited_scene_root())
		new_node.get_node("CollisionShape2D").call_deferred("set_owner", get_tree().get_edited_scene_root())

	if not has_node("Point"):
		new_node = Access.get_node("Point").duplicate()
		new_node.set_name("Point")

		call_deferred("add_child", new_node)
		new_node.call_deferred("set_owner", get_tree().get_edited_scene_root())
	pass