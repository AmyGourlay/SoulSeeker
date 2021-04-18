extends KinematicBody2D

const GRAVITY = 10
const FLOOR = Vector2(0, -1)
const JUMP_POWER = -250

var velocity = Vector2()
var is_dead = false
var waitTime = randf()*3.0+0.0 #random float between 0.0 and 3.99

const FIREBALL = preload("res://DragonFireball.tscn")

export(int) var hp = 10
export(Vector2) var size = Vector2(1,1)

func _ready():
	$Timer2.start()
	$Timer3.set_wait_time(waitTime) #Sets a random time for the timer between 0.0 and 3.99
	$Timer3.start()

#Method for when the Enemy is hit
func dead():
	hp -= 1
	$AnimationPlayer.play("Hit")
	get_parent().get_node("ScreenShake").screen_shake(1, 10, 100) #Shake the screen when hit
	knockback()
	var sound = $AudioStreamPlayer2D
	sound.play()
	if hp <= 0: #If their lives are at 0 
		is_dead = true
		$AnimationPlayer.play("Dead")
		velocity = Vector2(0, 0)
		$AnimatedSprite.play("dead")
		$CollisionShape2D.call_deferred("set_disabled", true)
		$RayCast2D.call_deferred("set_disabled", true)
		$Timer.start()

func _physics_process(delta):
		
	if is_dead == false:
		$AnimatedSprite.play("walk")
		velocity.y += GRAVITY
		
	if get_slide_count() > 0:
		for i in range(get_slide_count()):
			if "Player" in get_slide_collision(i).collider.name:
				get_slide_collision(i).collider.dead()
				
#Method to knock back the enemy when they are hit
func knockback():
	var player = get_parent().get_node("Player")
	var pos = player.get_node("Position2D")
	if pos.position.x == 1:
		velocity.x = -500
	else:
		velocity.x = 500
	move_and_slide(velocity, FLOOR)

func _on_Timer_timeout():
	queue_free() #release enemy

func _on_Timer2_timeout():
	velocity.y = JUMP_POWER #jump when timer ends
	
	
func _on_Timer3_timeout():
	var number = randi()%3+0 #random number between 0 and 2
	print("RANDOM:", number)
	var fireball = FIREBALL.instance()
	get_parent().add_child(fireball)
	fireball.set_fireball_direction(-1)
	#shoot fireball from random position
	if number == 0:
		fireball.position = $Position2D.global_position
	elif number == 1:
		fireball.position = $Position2D2.global_position
	elif number == 2:
		fireball.position = $Position2D3.global_position
	waitTime = randf()*3.0+0.0 #random float between 0.0 and 3.99


	

