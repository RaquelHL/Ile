extends Button

export(NodePath)var alvoPath
var alvo

func _ready():
	alvo = get_node(alvoPath)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rect_position = alvo.position
