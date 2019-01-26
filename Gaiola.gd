extends StaticBody2D

func _ready():
	
	$area1.connect("body_entered", self, "area1_enter")
	$area2.connect("body_entered", self, "area2_enter")
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func area1_enter(b):
	if(b.is_in_group("player")):
		print("area 1")
		$AnimationPlayer.play("shake")
func area2_enter(b):
	if(b.is_in_group("player")):
		print("area 2")
		$AnimationPlayer.play("shake")