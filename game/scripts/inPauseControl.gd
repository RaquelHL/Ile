extends Control

onready var config = get_node("/root/config")

var buttonMusicON = preload("res://game/images/buttons/musica_on.png")
var buttonMusicOFF = preload("res://game/images/buttons/musica_off.png")


var buttonEffectsON = preload("res://game/images/buttons/button_effects_on.png")
var buttonEffectsOFF = preload("res://game/images/buttons/button_effects_off.png")

var textPause = preload("res://game/images/buttons/str_jogo_pausado.png")
var textConfigure = preload("res://game/images/buttons/str_opcoes.png")

func _ready():
	if config.stateGame == 2:
		$textConfig.texture = textPause
		$btQuitGame.show()
	if config.stateGame == 1:
		$textConfig.texture = textConfigure
		$btQuitGame.hide()
		
	if config.audio.music:
		$btMusic.texture_normal = buttonMusicON
	else:
		$btMusic.texture_normal = buttonMusicOFF
		
	if config.audio.fx:
		$btEffects.texture_normal = buttonEffectsON
	else:
		$btEffects.texture_normal = buttonEffectsOFF

#func _process(delta):
#	pass


func closeInConfig():
	config.playClick()
	get_parent().queue_free()

func changeMusic():
	config.playClick()
	if config.audio.music:
		$btMusic.texture_normal = buttonMusicOFF
	else:
		$btMusic.texture_normal = buttonMusicON 

	config.changeMusic()

func changeEffects():
	config.playClick()
	if config.audio.fx:
		$btEffects.texture_normal = buttonEffectsOFF
	else:
		$btEffects.texture_normal = buttonEffectsON
		
	config.changeFx()

func quitGame():
	config.playClick()
	config.stateGame = 1
	get_tree().change_scene("res://game/scene/Main.tscn")
