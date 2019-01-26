extends "res://addons/mgt/custom_nodes/mgt_player_base.gd"


func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	input_direction.x = Input.is_action_pressed("direita") as int - Input.is_action_pressed("esquerda") as int
	calculate_speed(delta)
	move()
	
	jump_just_pressed = Input.is_action_pressed("pulo")
	
	#get_slide_collision()
#	pass
