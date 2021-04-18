extends Area2D

func _ready():
	pass
	
func _physics_process(delta):
	$Sprite.play("default") #Plays soul animation

#Connection to Area2D 
func _on_ChangeStage_body_entered(body):
	if "Player" in body.name: #if the collider was the player
		get_tree().change_scene("res://LevelCompleted.tscn") #Load level completed scene
		
		
	
