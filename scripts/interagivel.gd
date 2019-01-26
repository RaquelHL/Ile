extends CollisionObject2D

class_name Interagivel

var scnDialogo = preload("res://scenes/dialogo.tscn")
var manager

var textura

var foco = false

func _ready():
	manager = get_tree().get_nodes_in_group("manager")[0]
	connect("mouse_entered", self, "mouse_enter")
	connect("mouse_exited", self, "mouse_exit")
	pass # Replace with function body.

func mouse_enter():
	$arte.scale = Vector2(1.1,1.1)
	foco = true
	print("entrou")
	pass
	
func mouse_exit():
	$arte.scale = Vector2(1.0,1.0)
	foco = false
	print("saiu")
	pass
	
	
func _input(event):
	if(event is InputEventMouseButton and foco and event.pressed):
		print("clicou")
		var dist = (manager.player.position - self.position).length()
		print(dist)
		if(dist<100):
			interage_perto()
		else:
			interage_longe()
		get_tree().set_input_as_handled()

func interage_perto():
	pass

func interage_longe():
	pass
