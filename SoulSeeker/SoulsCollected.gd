extends Node2D

export(Texture) var emptySoul
export(Texture) var fullSoul
export(Vector2) var scale2 

onready var soul = $Sprite2
onready var soul2 = $Sprite3
onready var soul3 = $Sprite4
onready var soul4 = $Sprite5
onready var soul5 = $Sprite6
onready var soul6 = $Sprite7

#Sets the soul texture to represent the number of souls collected
func _ready():
	var level = GameDataManager.getUnlock()
	if level == 2:
		soul.texture = fullSoul
		soul.scale = scale2
		soul2.texture = emptySoul
		soul3.texture = emptySoul
		soul4.texture = emptySoul
		soul5.texture = emptySoul
		soul6.texture = emptySoul
	elif level == 3:
		soul.texture = fullSoul
		soul.scale = scale2
		soul2.texture = fullSoul
		soul2.scale = scale2
		soul3.texture = emptySoul
		soul4.texture = emptySoul
		soul5.texture = emptySoul
		soul6.texture = emptySoul
	elif level == 4:
		soul.texture = fullSoul
		soul.scale = scale2
		soul2.texture = fullSoul
		soul2.scale = scale2
		soul3.texture = fullSoul
		soul3.scale = scale2
		soul4.texture = emptySoul
		soul5.texture = emptySoul
		soul6.texture = emptySoul
	elif level == 5:
		soul.texture = fullSoul
		soul.scale = scale2
		soul2.texture = fullSoul
		soul2.scale = scale2
		soul3.texture = fullSoul
		soul3.scale = scale2
		soul4.texture = fullSoul
		soul4.scale = scale2
		soul5.texture = emptySoul
		soul6.texture = emptySoul
	elif level == 6:
		soul.texture = fullSoul
		soul.scale = scale2
		soul2.texture = fullSoul
		soul2.scale = scale2
		soul3.texture = fullSoul
		soul3.scale = scale2
		soul4.texture = fullSoul
		soul4.scale = scale2
		soul5.texture = fullSoul
		soul5.scale = scale2
		soul6.texture = emptySoul
	elif level == 7:
		soul.texture = fullSoul
		soul.scale = scale2
		soul2.texture = fullSoul
		soul2.scale = scale2
		soul3.texture = fullSoul
		soul3.scale = scale2
		soul4.texture = fullSoul
		soul4.scale = scale2
		soul5.texture = fullSoul
		soul5.scale = scale2
		soul6.texture = fullSoul
		soul6.scale = scale2
	else:
		soul.texture = emptySoul
		soul2.texture = emptySoul
		soul3.texture = emptySoul
		soul4.texture = emptySoul
		soul5.texture = emptySoul
		soul6.texture = emptySoul

