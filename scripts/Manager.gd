extends Node2D

export(bool) var interagindo = false
var ato = 1
export(NodePath) var playerPath
var player

func _ready():
	player = get_node(playerPath)
	muda_ato()

func muda_ato():
	match ato:
		1:
			player.acceleration = 150
			player.jump_speed = -100
		2:
			player.acceleration = 1000
			player.jump_speed = -200
			$AnimationPlayer.play("ato1-2")
		3:
			player.pode_voar = true
	