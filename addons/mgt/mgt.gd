tool
extends EditorPlugin

var dock

func _enter_tree():
	#get_tree().connect("node_added", self, "_on_SceneTree_node_added")
	
	add_custom_type("PlayerBase", "KinematicBody2D", preload("custom_nodes/mgt_player_base.gd"), preload("icons/icon_player_base.png"))
	#add_custom_type("SaveSystem", "Node", preload("custom_nodes/mgt_save_system.gd"), preload("icons/icon_save_system.png"))
	#add_custom_type("MapSystem", "CanvasLayer", preload("custom_nodes/mgt_map_system.gd"), preload("icons/icon_map_system.png"))
	#add_custom_type("Powerup", "Node", preload("custom_nodes/mgt_powerup.gd"), preload("icons/icon_powerup.png"))
	#add_custom_type("Access", "Node2D", preload("custom_nodes/mgt_access.gd"), preload("icons/icon_access.png"))
	add_custom_type("State", "Node", preload("custom_nodes/mgt_state.gd"), preload("icons/icon_state.png"))

func _exit_tree():
	
	remove_custom_type("PlayerBase")
	#remove_custom_type("SaveSystem")
	#remove_custom_type("MapSystem")
	#remove_custom_type("Access")
	remove_custom_type("State")
