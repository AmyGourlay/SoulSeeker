extends Control

func _ready():
	pass
	
func _physics_process(delta):
	if $MarginContainer2/VBoxContainer/TextureButton.is_hovered() == true:
		$MarginContainer2/VBoxContainer/TextureButton.grab_focus()
	if $MarginContainer3/VBoxContainer/TextureButton2.is_hovered() == true:
		$MarginContainer3/VBoxContainer/TextureButton2.grab_focus()


func _on_TextureButton_pressed():
	get_tree().change_scene("res://LevelScreen.tscn")


func _on_TextureButton2_pressed():
	get_tree().change_scene("res://TitleScreen.tscn")
	
