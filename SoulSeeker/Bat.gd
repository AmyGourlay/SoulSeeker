extends Position2D

export(int) var direction

#Method to play flying animation for bats on title screen
func _ready():
	if direction == 0:
		$AnimationPlayer.play("Flying")
	elif direction == 1:
		$AnimationPlayer.play("Flying")
		$Sprite.flip_h = true
	
