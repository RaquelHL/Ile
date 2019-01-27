extends Control
onready var config = get_node("/root/config")
var modalConfig = preload("res://game/scene/inConfig.tscn")


func _ready():
	config.music = get_parent().get_node("AudioInGame");
	config.click = get_parent().get_node("click");
	config.playMusic()

#func _process(delta):
#	pass

func returnGame():
	get_tree().change_scene("res://game/scene/Main.tscn")


func inPause():
	config.stateGame = 2
	config.playClick()
	add_child(modalConfig.instance()); 
	pass # Replace with function body.
