extends Node2D

export (int) var level
export (String, FILE, "*.tscn") var level_to_load
export (bool) var enabled
export (bool) var score_goal_met

export (Texture) var blocked_texture
export (Texture) var open_texture
export (Texture) var goal_met
export (Texture) var goal_not_met

var level_to_unlock
var goal

onready var level_label = $TextureButton/Label
onready var button = $TextureButton
onready var star = $Sprite
onready var star2 = $Sprite2
onready var star3 = $Sprite3


func _ready():
	level_to_unlock = GameDataManager.getUnlock()
	if level <= level_to_unlock:
		enabled = true
		$TextureButton/Label.visible = true
	else:
		enabled = false
		$TextureButton/Label.visible = false
	if GameDataManager.levelStars.has(level):
		goal = GameDataManager.levelStars[level]["stars_unlocked"]
	
	setup()

#Method to set the star texture of each level button 
func setup():
	level_label.text = String(level)
	if enabled:
		button.texture_normal = open_texture
	else:
		button.texture_normal = blocked_texture
	
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
		
func _on_TextureButton_pressed():
	if enabled:
		GameDataManager.setStarsToZero()
		var sound = $AudioStreamPlayer2D
		sound.play()
		var t = Timer.new()
		t.set_wait_time(0.05)
		add_child(t)
		t.start()
		yield(t, "timeout")
		t.queue_free()
		get_tree().change_scene(level_to_load)
