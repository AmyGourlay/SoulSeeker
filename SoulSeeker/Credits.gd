extends Node2D

func _ready():
	pass 

func _on_TextureButton_pressed():
	get_tree().change_scene("res://TitleScreen.tscn") #Change to title scene
