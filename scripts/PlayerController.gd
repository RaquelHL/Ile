extends "res://addons/mgt/custom_nodes/mgt_player_base.gd"

export(NodePath) var inventarioPath

var pode_voar = false
var ultimo_pulo = 0
var pulo_cooldown = 400
onready var manager = $'/root/Main/Manager'
onready var config = get_node("/root/config")

var inventario
var itens = []

func _ready():
	inventario = get_node(inventarioPath)
	jump_speed = -1200
	manager.interagindo = true
	
	pass # Replace with function body.

func _physics_process(delta):
	if not manager.interagindo:
		input_direction.x = (Input.is_action_pressed("direita") as int) - (Input.is_action_pressed("esquerda") as int)
		if(Input.is_action_just_pressed("pulo") and OS.get_ticks_msec()-ultimo_pulo>pulo_cooldown):
			ultimo_pulo = OS.get_ticks_msec()
			jump_just_pressed = true
			$AnimatedSprite.play("fly")
			$AnimatedSprite.frame = 0
			config.playShot()
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
		if(current_speed.length()>0):
			$AnimatedSprite.animation = "walk"
		else:
			$AnimatedSprite.animation = "idle"

func can_jump():
	if(pode_voar):
		if(not is_on_floor()):
			$AnimatedSprite.animation = "fly"
		return true
	else:
		return is_on_floor()
		
func add_item(item):
	itens.append(item)
	#item.get_parent().remove_child(item)
	#inventario.add_child(item)
	var rect = TextureRect.new()
	rect.texture = item.textura
	inventario.add_child(rect)
	item.queue_free()