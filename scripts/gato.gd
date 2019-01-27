extends Interagivel

var fala_parte = 0


func interage_longe():
	pass

func interage_perto():
	var dialogo = scnDialogo.instance()
	
	var falas = []
	if manager.parte == 3:
		if fala_parte == 0:
			falas = [
				dialogo.Fala.new(self, "Miau...")
			]
			config.playCatMeow()
			fala_parte = 1
		elif fala_parte == 1:
			falas = [
				dialogo.Fala.new(self, "MI AU..."),
			]
			config.playCatMeow()
			fala_parte = 2
		elif fala_parte == 2:
			falas = [
				dialogo.Fala.new(self, "Céus, como você é chato!"),
			]
		dialogo.falas = falas
		dialogo.play()

func dialogo_desespero():
	var dialogo = scnDialogo.instance()
	var falas = [
		dialogo.Fala.new(self, "O que você está fazendo?"),
		dialogo.Fala.new(manager.player, "♪ ♫ ♪ ♪"),
		dialogo.Fala.new(self, "Quer usar minha porta? Pode usar."),
		dialogo.Fala.new(manager.player, "♫ ♪"),
		dialogo.Fala.new(self, "O senhor é um pássaro bem abusado, né?"),
		dialogo.Fala.new(self, "Não tenho qualquer motivação para te ajudar a passar por ela."),
		dialogo.Fala.new(self, "Se vira."),
	]
	
	manager.parte = 3
	
	dialogo.falas = falas
	dialogo.play()
	pass