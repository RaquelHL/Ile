extends CollisionObject2D

var scnDialogo = preload("res://scenes/dialogo.tscn")
var manager

var foco = false

func _ready():
	manager = get_tree().get_nodes_in_group("manager")[0]
	connect("mouse_entered", self, "mouse_enter")
	connect("mouse_exited", self, "mouse_exit")
	pass # Replace with function body.

func mouse_enter():
	$icon.scale = Vector2(1.1,1.1)
	foco = true
	print("entrou")
	pass
	
func mouse_exit():
	$icon.scale = Vector2(1.0,1.0)
	foco = false
	print("saiu")
	pass
	
	
func _input(event):
	if(event is InputEventMouseButton and foco and event.pressed):
		print("clicou")
		interage()
		get_tree().set_input_as_handled()

func interage():
	var dialogo = scnDialogo.instance()
	dialogo.alvo = manager.player
	dialogo.texto = "Aquele é o robozinho do Godot"
	dialogo.play()
