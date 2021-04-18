extends Node2D

func _ready():
	pass # Replace with function body.
	
func _on_TextureButton_pressed():
	get_tree().change_scene("res://TitleScreen.tscn")
