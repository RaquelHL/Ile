extends Interagivel


func interage_longe():
	var dialogo = scnDialogo.instance()
	var falas = [
		dialogo.Fala.new(manager.player, "É um novelo de lã")
	]
	dialogo.falas = falas
	dialogo.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
