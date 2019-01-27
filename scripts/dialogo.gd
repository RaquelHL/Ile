extends Sprite
var manager
var falas = []
var fala_atual = 0

func _ready():
	manager = get_tree().get_nodes_in_group("manager")[0]
	if(manager.ato == 2):
		scale = Vector2(.4,.4)
	
	manager.interagindo = true
	pass # Replace with function body.

func play():
	if(get_parent()):
		get_parent().remove_child(self)
	
	if falas[fala_atual].texto == '♫':
		# TOCA 
		pass
		
	if falas[fala_atual].anim:
		falas[fala_atual].alvo.get_node("AnimationPlayer").play(falas[fala_atual])
	
	falas[fala_atual].alvo.add_child(self)
	position = Vector2((200*scale.x)/2,-(60*scale.y)/2 - 16)
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
				manager.interagindo = false
				queue_free()
			else:
				play()

class Fala:
	var alvo
	var texto
	var anim
	
	func _init(a, t):
		alvo = a
		texto = t
		
	func set_anim(a):
		anim = a
		return self