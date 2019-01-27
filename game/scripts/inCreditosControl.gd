extends Control
onready var config = get_node("/root/config")

func _ready():
	if config.stateGame == 4:
		config.music = get_parent().get_node("music")
		config.playMusic()
		$btBack.hide()
	pass 

#func _process(delta):
#	pass

func closeInConfig():
	config.playClick()
	get_parent().queue_free()