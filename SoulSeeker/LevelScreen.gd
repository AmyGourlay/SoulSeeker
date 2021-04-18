extends Node

export(int) var index

func _ready():
	pass 

func _on_TextureRect_pressed():
	var sound = $AudioStreamPlayer2D
	sound.play()
	var t = Timer.new()
	t.set_wait_time(0.05)
	add_child(t)
	t.start()
	yield(t, "timeout")
	t.queue_free()
	get_tree().change_scene("res://TitleScreen.tscn")


func _on_TextureButton_pressed():
	var sound = $AudioStreamPlayer2D
	sound.play()
	var t = Timer.new()
	t.set_wait_time(0.05)
	add_child(t)
	t.start()
	yield(t, "timeout")
	t.queue_free()
	if index == 2:
		get_tree().change_scene("res://LevelScreen.tscn")
	else:
		get_tree().change_scene("res://LevelScreen2.tscn")
