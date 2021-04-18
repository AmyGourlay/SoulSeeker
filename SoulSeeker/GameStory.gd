extends Node2D

func _ready():
	$Sprite.flip_h = true
	$Timer.start()

func _on_Timer_timeout():
	$AnimationPlayer.play("SoulShatter")

func _on_AnimationPlayer_animation_finished(anim_name):
	$AnimationPlayer.stop()

func _on_TextureButton_pressed():
	get_tree().change_scene("res://LevelScreen.tscn")
