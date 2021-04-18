extends Control

var goal
onready var star = $Sprite
onready var star2 = $Sprite2
onready var star3 = $Sprite3

export (Texture) var goal_met
export (Texture) var goal_not_met

#Method sets texture for stars collected
func _ready():
	goal = GameDataManager.getStars()
	if goal == 1:
		star.texture = goal_met
		star2.texture = goal_not_met
		star3.texture = goal_not_met
	elif goal == 2:
		star.texture = goal_met
		star2.texture = goal_met
		star3.texture = goal_not_met
	elif goal == 3:
		star.texture = goal_met
		star2.texture = goal_met
		star3.texture = goal_met
	else:
		star.texture = goal_not_met
		star2.texture = goal_not_met
		star3.texture = goal_not_met

func _physics_process(delta):
	if $MarginContainer2/VBoxContainer/TextureButton.is_hovered() == true:
		$MarginContainer2/VBoxContainer/TextureButton.grab_focus()
	if $MarginContainer3/VBoxContainer/TextureButton2.is_hovered() == true:
		$MarginContainer3/VBoxContainer/TextureButton2.grab_focus()

func _on_TextureButton_pressed():
	GameDataManager.unlock()
	if GameDataManager.getUnlock() <= 3:
		get_tree().change_scene("res://LevelScreen.tscn")
	elif GameDataManager.getUnlock() > 3 && GameDataManager.getUnlock() <= 6:
		get_tree().change_scene("res://LevelScreen2.tscn")
	else:
		get_tree().change_scene("res://GameCompleted.tscn")


func _on_TextureButton2_pressed():
	get_tree().change_scene("res://TitleScreen.tscn")
