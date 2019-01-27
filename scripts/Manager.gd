extends Node2D

export(bool) var interagindo = false
var ato = 1
export(NodePath) var playerPath
var player

var passaro_final_count = 0

export var parte = 1 setget set_parte

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
			player.pode_mover_lados = false

func _on_espingarda_body_entered(body):
	if parte == 3 and not $AnimationPlayer.is_playing():
		$AnimationPlayer.play('espingarda_atirando')
	pass

func set_parte(p):
	parte = p
	print("parte:", p)

func _on_Ato3Ativar_body_entered(body):
	if body.is_in_group('player'):
		ato = 3
		muda_ato()
		pass
	pass

func _on_trigger_body_entered(body):
	if passaro_final_count == 0:
		$"../EixoPassaros/Passaro1/AnimationPlayer".play('passaro1_chegando')
	elif passaro_final_count == 1:
		$"../EixoPassaros/EixoPassaro2/Passaro2/AnimationPlayer".play('passaro1_chegando')
	elif passaro_final_count == 2:
		$"../EixoPassaros/EixoPassaro3/Passaro2/AnimationPlayer".play('passaro1_chegando')
	elif passaro_final_count == 3:
		$"../EixoPassaros/EixoPassaro4/Passaro2/AnimationPlayer".play('passaro1_chegando')
	
	passaro_final_count += 1
	pass
