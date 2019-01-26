extends Interagivel

func _ready():
	textura = load("res://icon.png")
	pass

func interage_longe():
	var dialogo = scnDialogo.instance()
	var falas = [
		dialogo.Fala.new(manager.player, "Aquele é o robozinho do Godot"),
		dialogo.Fala.new(manager.player, "E essa é a segunda frase"),
		dialogo.Fala.new(self, "Eu sei falar também")
	]
	
	dialogo.falas = falas
	dialogo.play()

func interage_perto():
	manager.player.add_item(self)
	pass