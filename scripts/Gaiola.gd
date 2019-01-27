extends StaticBody2D

var batidas = 0
var max_batidas = 5
var batida_velocidade = 90

var manager

onready var config = get_node("/root/config")

func _ready():
	
	manager = get_tree().get_nodes_in_group("manager")[0]
	
	$area1.connect("body_entered", self, "area_enter")
	$area2.connect("body_entered", self, "area_enter")
	
	pass

func area_enter(b):
	if(batidas>=max_batidas):
		return
	if(b.is_in_group("player")):
		if(b.current_speed.length()>batida_velocidade):
			
			$AnimationPlayer.play("shake")
			batidas += 1
			print("bateu "+str(batidas)+" vezes")
			config.playChain()
	if(batidas>=max_batidas):
		manager.ato = 2
		manager.muda_ato()
