extends Interagivel

func interage_longe():
	pass

func interage_perto():
	var dialogo = scnDialogo.instance()
	var falas = [
		dialogo.Fala.new(self, "Miau")
		
	]
	dialogo.falas = falas
	dialogo.play()
