"""
	Don't modify this file unless you know what you're doing.
"""
tool
extends CanvasLayer

signal scene_changing(to)
signal scene_changed(to)

export(String, DIR) var sectors_folder = "res://sectors"
var _current_sector = null setget , get_current_sector
var _sector_name = ""
var access_name = ""
var fixed_data = {}

func _ready():
	if Engine.is_editor_hint(): return
	return

func change_sector(sector, access = ""):
	if Engine.is_editor_hint(): return
	
	var sector_file_path = sectors_folder+"/"+sector+".tscn"
	access_name = access
	
	emit_signal("scene_changing", sector_file_path)
	
	if _current_sector:
		_current_sector.queue_free()
	
	_current_sector = load(sector_file_path).instance()
	get_parent().add_child(_current_sector)
	
	emit_signal("scene_changed", sector_file_path)
	pass

func reload_sector():
	if Engine.is_editor_hint(): return

	var sector_file_path = sectors_folder+"/"+_sector_name+".tscn"

	if _current_sector:
		_current_sector.queue_free()
	_current_sector = load(sector_file_path).instance()
	get_parent().add_child(_current_sector)

	emit_signal("scene_changed", sector_file_path)
	pass

func goes_through_access(access):
	if Engine.is_editor_hint(): return
	
	access_name = access.destination_access_name
	_sector_name = access.destination_sector_name
	emit_signal("scene_changing", _sector_name)
	$AnimationPlayer.play("scene_transition")

func get_current_sector():
	if Engine.is_editor_hint(): return
	return _current_sector

func init_on_editor():
	var MapSystem = preload("MapSystem.tscn").instance()
	
	var new_node
	if not has_node("ColorRect"):
		new_node = MapSystem.get_node("ColorRect").duplicate()
		new_node.set_name("ColorRect")
		
		call_deferred("add_child", new_node)
		new_node.call_deferred("set_owner", get_tree().get_edited_scene_root())
	
	if not has_node("AnimationPlayer"):
		new_node = MapSystem.get_node("AnimationPlayer").duplicate()
		new_node.set_name("AnimationPlayer")
		
		call_deferred("add_child", new_node)
		new_node.call_deferred("set_owner", get_tree().get_edited_scene_root())
	pass