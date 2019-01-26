extends "res://addons/mgt/custom_nodes/mgt_player_base.gd"

var pode_voar = false
var ultimo_pulo = 0
var pulo_cooldown = 500

func _ready():
	jump_speed = -1200
	pass # Replace with function body.

func _physics_process(delta):
	input_direction.x = Input.is_action_pressed("direita") as int - Input.is_action_pressed("esquerda") as int
	calculate_speed(delta)
	move()
	
	
	if(Input.is_action_pressed("pulo") and OS.get_ticks_msec()-ultimo_pulo>pulo_cooldown):
		ultimo_pulo = OS.get_ticks_msec()
		jump_just_pressed = true
		$AnimatedSprite.play("fly")
		$AnimatedSprite.frame = 0
	else:
		jump_just_pressed = false
	
	#get_slide_collision()
	
	if(current_speed.x>0):
		$AnimatedSprite.flip_h = false
	else:
		if(current_speed.x<0):
			$AnimatedSprite.flip_h = true
#	
	if(is_on_floor()):
		$AnimatedSprite.animation = "idle"

func can_jump():
	if(pode_voar):
		if(not is_on_floor()):
			$AnimatedSprite.animation = "fly"
		return true
	else:
		return is_on_floor()