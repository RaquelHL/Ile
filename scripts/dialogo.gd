extends Sprite
var alvo

var falas = []
var fala_atual = 0

func _ready():
	
	pass # Replace with function body.

func play():
	if(get_parent()):
		get_parent().remove_child(self)
	falas[fala_atual].alvo.add_child(self)
	position = Vector2(160,-100)
	$RichTextLabel.text = falas[fala_atual].texto
	$Tween.interpolate_property($RichTextLabel, "visible_characters", 0, falas[fala_atual].texto.length(), falas[fala_atual].texto.length()*0.05, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()
	
func _unhandled_input(event):
	if((event is InputEventKey && event.scancode == KEY_SPACE) or (event is InputEventMouseButton and event.pressed)):
		if($Tween.is_active()):
			$Tween.stop_all()
			$RichTextLabel.visible_characters = -1
		else:
			fala_atual += 1
			if(fala_atual>=falas.size()):
				queue_free()
			else:
				play()
	
			
class Fala:
	var alvo
	var texto
	
	func _init(a, t):
		alvo = a
		texto = t
	