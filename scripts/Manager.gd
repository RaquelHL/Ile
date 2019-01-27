extends Node2D

export(bool) var interagindo = false
var ato = 1
export(NodePath) var playerPath
var player
onready var conf = $"/root/config"

func _ready():
	player = get_node(playerPath)
	config.music = get_parent().get_node("OST")
	config.click = get_parent().get_node("Click")
	config.jump = get_parent().get_node("Jump")
	config.cat_meow = get_parent().get_node("catMeow")
	config.rat_squeaking = get_parent().get_node("ratSqueak")
	config.open_door = get_parent().get_node("openDoor")
	config.chain = get_parent().get_node("chain")
	config.wood_drop = get_parent().get_node("woodDrop")
	config.victory = get_parent().get_node("victory")
	config.shot = get_parent().get_node("shot")
	
	muda_ato()

func muda_ato():
	match ato:
		1:
			player.acceleration = 150
			player.jump_speed = -100
			config.playMusic()
		2:
			player.acceleration = 1000
			player.jump_speed = -200
			$AnimationPlayer.play("ato1-2")
		3:
			player.pode_voar = true