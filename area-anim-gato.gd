extends Area2D

func _ready():
	connect("body_entered", self, "body_enter")
	
func body_enter(body):
	if body.is_in_group('player'):
		$'../gato'.get_node("AnimationPlayer").play("gato_entra")
		$'/root/Main/Manager'.parte = 2
		queue_free()