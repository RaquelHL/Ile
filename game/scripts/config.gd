extends Node
var audio = {music = true , fx=  true}

var music
var click
var jump
var cat_meow
var rat_squeaking
var open_door
var chain
var wood_drop
var victory
var shot

# stateGame
#1 : home
#2 : ingame
#3 : pause
#4 : final
var stateGame = 1

#func _ready():
#	pass

#func _process(delta):
#	pass

func changeMusic():
	if audio.music:
		config.music.stop()
		audio.music = false
	else:
		music.play()
		audio.music = true
		

func changeFx():
	if audio.fx:
		audio.fx = false
	else:
		audio.fx = true
		
func playMusic():
	if music:
		music.play()
	pass

func playClick():
	if click:
		if audio.fx:
			click.play()
	pass
	
func playJump():
	if jump:
		if audio.fx:
			jump.play()
	pass

func playCatMeow():
	if cat_meow:
		if audio.fx:
			cat_meow.play()
	pass
	
func playRatSqueaking():
	if rat_squeaking:
		if audio.fx:
			rat_squeaking.play()
	pass

func playOpenDoor():
	if open_door:
		if audio.fx:
			open_door.play()
	pass
	
func playChain():
	if chain:
		if audio.fx:
			chain.play()
	pass

func playWoodDrop():
	if wood_drop:
		if audio.fx:
			wood_drop.play()
	pass

func playVictory():
	if audio.fx:
		if victory:
			victory.play()

func playShot():
	if audio.fx:
		if shot:
			shot.play()

func getFx():
	return audio.fx