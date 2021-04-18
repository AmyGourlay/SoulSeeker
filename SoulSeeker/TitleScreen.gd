extends Node

func _ready():
	$MarginContainer2/VBoxContainer2/TextureButton.grab_focus()
	

func _physics_process(delta):
	if $MarginContainer2/VBoxContainer2/TextureButton.is_hovered() == true:
		$MarginContainer2/VBoxContainer2/TextureButton.grab_focus()
	if $MarginContainer2/VBoxContainer2/TextureButton2.is_hovered() == true:
		$MarginContainer2/VBoxContainer2/TextureButton2.grab_focus()
	if $MarginContainer2/VBoxContainer2/TextureButton3.is_hovered() == true:
		$MarginContainer2/VBoxContainer2/TextureButton3.grab_focus()

func _on_TextureButton_pressed():
	var sound = $AudioStreamPlayer2D
	sound.play()
	var t = Timer.new()
	t.set_wait_time(0.05)
	add_child(t)
	t.start()
	yield(t, "timeout")
	t.queue_free()
	get_tree().change_scene("res://GameStory.tscn")


func _on_TextureButton2_pressed():
	var sound = $AudioStreamPlayer2D
	sound.play()
	var t = Timer.new()
	t.set_wait_time(0.05)
	add_child(t)
	t.start()
	yield(t, "timeout")
	t.queue_free()
	get_tree().quit()


func _on_TextureButton3_pressed():
	var sound = $AudioStreamPlayer2D
	sound.play()
	var t = Timer.new()
	t.set_wait_time(0.05)
	add_child(t)
	t.start()
	yield(t, "timeout")
	t.queue_free()
	get_tree().change_scene("res://Instructions.tscn")


func _on_TextureButton4_pressed():
	var sound = $AudioStreamPlayer2D
	sound.play()
	var t = Timer.new()
	t.set_wait_time(0.05)
	add_child(t)
	t.start()
	yield(t, "timeout")
	t.queue_free()
	get_tree().change_scene("res://Credits.tscn")
