extends Control

onready var config = get_node("/root/config")

var modalConfig = preload("res://game/scene/inConfig.tscn")
var modalCredito = preload("res://game/scene/inCreditos.tscn")

func _ready():
	config.music = get_parent().get_node("introMenu")
	config.click = get_parent().get_node("click")
	config.playMusic()

#func _process(delta):
#	pass

func startGame():
	config.playClick()
	get_tree().change_scene("res://main.tscn")

func buttonConfiguration():
	config.playClick()
	add_child(modalConfig.instance());

func buttonInfo():
	config.playClick()
	add_child(modalCredito.instance());

func exitGame():
	config.playClick()
	get_tree().quit()


func _on_musicMenu_finished():
	config.music = get_parent().get_node("musicMenu");
	config.playMusic()
	pass
