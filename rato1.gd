extends Interagivel

func _ready():

	pass # Replace with function body.

func dialogo_introducao():
	
	var dialogo = scnDialogo.instance()
	var falas = [
		dialogo.Fala.new(self, "Bom dia..."),
		dialogo.Fala.new(self, "Sabe, todo esse tempo que estivemos aqui, me fez pensar uma coisa."),
		dialogo.Fala.new(self, "Você é bem minimalista, né?"),
		dialogo.Fala.new(manager.player, "♪"),
		dialogo.Fala.new(self, "Digo... você parece tranquilo aí, onde é pequeno..."),
		dialogo.Fala.new(self, "Não quero dizer apertado, nem ofender sua morada."),
		dialogo.Fala.new(self, "É que eu não conseguiria viver assim. Preciso de mais espaço."),
		dialogo.Fala.new(self, "Como esta casa, espaçosa."),
		dialogo.Fala.new(self, "É a minha casa."),
		dialogo.Fala.new(self, "Bem, posso te mostrar, o que acha?"),
		
	]
	
	dialogo.falas = falas
	dialogo.play()
	config.playRatSqueaking()
	"""var dialogo = scnDialogo.instance()
	var falas = [
		
	]
	dialogo.falas = falas
	dialogo.play()"""