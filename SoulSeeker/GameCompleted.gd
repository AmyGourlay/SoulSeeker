extends Node2D

func _ready():
	$Sprite8.flip_h = true
	$Timer.start()

func _on_Timer_timeout():
	$AnimationPlayer.play("SoulsJoin")

func _on_AnimationPlayer_animation_finished(anim_name):
	$AnimationPlayer.stop()
