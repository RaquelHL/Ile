extends Node2D

var scnDialogo = preload("res://scenes/dialogo.tscn")

var ato = 1
export(NodePath) var playerPath
var player

func _ready():
	player = get_node(playerPath)
	muda_ato()
	var dialogo = scnDialogo.instance()
	dialogo.alvo = player
	dialogo.texto = "teste de dialogo longo só pra ver como que fica o dialogo longo"
	dialogo.play()
	add_child(dialogo)


func muda_ato():
	match ato:
		1:
			player.acceleration = 100
		2:
			player.acceleration = 3000
			$AnimationPlayer.play("ato1-2")
	