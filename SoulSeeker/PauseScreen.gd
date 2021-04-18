extends Control

func _ready():
	$MarginContainer/CenterContainer/VBoxContainer/TextureButton.grab_focus()

func _physics_process(delta):
	if $MarginContainer/CenterContainer/VBoxContainer/TextureButton.is_hovered() == true:
		$MarginContainer/CenterContainer/VBoxContainer/TextureButton.grab_focus()
	if $MarginContainer/CenterContainer/VBoxContainer/TextureButton2.is_hovered() == true:
		$MarginContainer/CenterContainer/VBoxContainer/TextureButton2.grab_focus()

#Stop or start game process
func _input(event):
	if event.is_action_pressed("ui_cancel"):
		$MarginContainer/CenterContainer/VBoxContainer/TextureButton.grab_focus()
		get_tree().paused = not get_tree().paused
		visible = not visible


func _on_TextureButton_pressed():
	var sound = $AudioStreamPlayer2D
	sound.play()
	var t = Timer.new()
	t.set_wait_time(0.05)
	add_child(t)
	t.start()
	yield(t, "timeout")
	t.queue_free()
	get_tree().paused = not get_tree().paused
	visible = not visible


func _on_TextureButton2_pressed():
	var sound = $AudioStreamPlayer2D
	sound.play()
	var t = Timer.new()
	t.set_wait_time(0.05)
	add_child(t)
	t.start()
	yield(t, "timeout")
	t.queue_free()
	get_tree().paused = not get_tree().paused
	get_tree().change_scene("res://TitleScreen.tscn")


func _on_TextureButton3_pressed():
	var sound = $AudioStreamPlayer2D
	sound.play()
	var t = Timer.new()
	t.set_wait_time(0.05)
	add_child(t)
	t.start()
	yield(t, "timeout")
	t.queue_free()
	get_tree().paused = not get_tree().paused
	get_tree().change_scene("res://Instructions.tscn")
