extends Area2D

func _ready():
	pass 

func _on_Star_body_entered(body):
	if "Player" in body.name:
		GameDataManager.updateStars()
		var sound = $AudioStreamPlayer2D
		sound.play()
		$Timer.start()
		
func _on_Timer_timeout():
	queue_free()
