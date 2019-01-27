extends "res://addons/mgt/custom_nodes/mgt_player_base.gd"


var pode_voar = false
var ultimo_pulo = 0
var pulo_cooldown = 400
onready var manager = $'/root/Main/Manager'
onready var config = get_node("/root/config")
var pode_mover_lados = true

var inventario
var itens = []

func _ready():
	jump_speed = -1200
	manager.interagindo = true
	
	pass # Replace with function body.

func _physics_process(delta):
	if not manager.interagindo:
		if pode_mover_lados:
			input_direction.x = (Input.is_action_pressed("direita") as int) - (Input.is_action_pressed("esquerda") as int)
		if(Input.is_action_just_pressed("pulo") and OS.get_ticks_msec()-ultimo_pulo>pulo_cooldown):
			ultimo_pulo = OS.get_ticks_msec()
			jump_just_pressed = true
			#if pode_voar:
			$AnimatedSprite.play("fly")
			$AnimatedSprite.frame = 0
			config.playJump()
		else:
			jump_just_pressed = false
	
	calculate_speed(delta)
	move()
	
	#get_slide_collision()
	
	if(current_speed.x>0):
		$AnimatedSprite.flip_h = false
	else:
		if(current_speed.x<0):
			$AnimatedSprite.flip_h = true
#	
	if(is_on_floor()):
		if current_speed.x!=0:
			$AnimatedSprite.animation = "walk"
		else:
			$AnimatedSprite.animation = "idle"
	else:
		$AnimatedSprite.animation = "fly"

func can_jump():
	if(pode_voar):
		if(not is_on_floor() and pode_voar):
			$AnimatedSprite.animation = "fly"
		return true
	else:
		return is_on_floor()
		