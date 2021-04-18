extends Area2D

const SPEED = 100
var velocity = Vector2()
var direction = 1

func _ready():
	pass 

#Method to send firball in the direction the player is facing
func set_fireball_direction(dir):
	direction = dir
	if dir == -1:
		$AnimatedSprite.flip_h = false
	else:
		$AnimatedSprite.flip_h = true
	
func _physics_process(delta):
	velocity.x = SPEED * delta * direction
	translate(velocity)
	$AnimatedSprite.play("shoot")

#Method to release the fireball when its no longer on the screen
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

#Method kill Enemy or Player if hit by fireball
func _on_Fireball_body_entered(body):
	if "Enemy" in body.name:
		body.dead()
	if "Player" in body.name:
		body.dead()
	queue_free()
