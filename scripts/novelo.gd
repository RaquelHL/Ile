extends Interagivel

func interage_perto():
	if manager.parte == 2:
		$AnimationPlayer.play("cair")

func interage_longe():
	var dialogo = scnDialogo.instance()
	var falas
	print(manager.parte)
	if(manager.parte == 1):
		falas = [
			dialogo.Fala.new(manager.player, "É um novelo de lã")
		]	
	else:
		if manager.parte == 2:
			falas = [
				dialogo.Fala.new(manager.player, "Gatos gostam de novelo de lã..")
			]	
	dialogo.falas = falas
	dialogo.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
