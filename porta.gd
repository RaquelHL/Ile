extends Area2D

var ja_playou = false

func _on_porta_body_entered(body):
	if(body.is_in_group("player") and not ja_playou):
		$AnimationPlayer.play("anim")
		ja_playou = true
