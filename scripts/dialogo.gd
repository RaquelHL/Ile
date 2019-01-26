extends Sprite
var alvo
var texto = "sem texto"
func _ready():
	
	pass # Replace with function body.

func play():
	alvo.add_child(self)
	position = Vector2(160,-100)
	$RichTextLabel.text = texto
	$Tween.interpolate_property($RichTextLabel, "visible_characters", 0, texto.length(), texto.length()*0.05, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()
	print(position)
	
func _unhandled_input(event):
	if((event is InputEventKey && event.scancode == KEY_SPACE) or (event is InputEventMouseButton and event.pressed)):
		if($Tween.is_active()):
			$Tween.stop_all()
			$RichTextLabel.visible_characters = -1
		else:
			queue_free()
			pass