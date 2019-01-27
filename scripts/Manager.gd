extends Node2D

export(bool) var interagindo = false
var ato = 1
export(NodePath) var playerPath
var player

onready var config = get_node("/root/config")

var passaro_final_count = 0

export var parte = 1 setget set_parte

var modalCredito = preload("res://game/scene/inCreditos.tscn")

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

func play_door():
	config.playOpenDoor()
	
func play_shot():
	config.playShot()
	
func playDrop():
	config.playWoodDrop()
	
func playVictory():
	config.playVictory()
	
func callCreditos():
	config.stateGame = 4
	get_tree().change_scene("res://game/scene/inCreditos.tscn")