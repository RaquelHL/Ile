extends Node2D


var ato = 1
export(NodePath) var playerPath
var player

func _ready():
	player = get_node(playerPath)
	muda_ato()
	


func muda_ato():
	match ato:
		1:
			player.acceleration = 300
			player.jump_speed = -500
		2:
			player.acceleration = 3000
			player.jump_speed = -1200
			player.pode_voar = true
			$AnimationPlayer.play("ato1-2")
	