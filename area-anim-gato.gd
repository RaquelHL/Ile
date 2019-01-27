extends Area2D

func _ready():
	connect("body_entered", self, "body_enter")
	
func body_enter(body):
	$'../gato'.get_node("AnimationPlayer").play("gato_entra")
	queue_free()