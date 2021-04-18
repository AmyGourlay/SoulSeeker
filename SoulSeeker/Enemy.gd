extends KinematicBody2D

const GRAVITY = 10
const FLOOR = Vector2(0, -1)

var velocity = Vector2()
var direction = 1
var is_dead = false

export(int) var speed = 30
export(int) var hp = 1
export(Vector2) var size = Vector2(1,1)
export(int) var type

func _ready():
	scale = size

#Method for when the Enemy is hit
func dead():
	hp -= 1
	$AnimationPlayer.play("Hit")
	knockback()
	var sound = $AudioStreamPlayer2D
	sound.play()
	if hp <= 0: #if they are out of lives
		is_dead = true
		$AnimationPlayer.play("Dead")
		velocity = Vector2(0, 0)
		$AnimatedSprite.play("dead")
		$CollisionShape2D.call_deferred("set_disabled", true)
		$RayCast2D.call_deferred("set_disabled", true)
		$Timer.start()

func _physics_process(delta):
	velocity.x = speed * direction

	var objPlayer = get_parent().get_node("Player")
	var objEnemy = get_parent()
	var distance = objPlayer.global_position - objEnemy.global_position
		
	if is_dead == false:
	
		if type == 2:
			if direction == 1:
				$AnimatedSprite.flip_h = true
			else:
				$AnimatedSprite.flip_h = false
		else:
			if direction == 1:
				$AnimatedSprite.flip_h = false
			else:
				$AnimatedSprite.flip_h = true
		
		$AnimatedSprite.play("walk")
		velocity = move_and_slide(velocity, FLOOR)
		velocity.y += GRAVITY
		
	#if touching wall, turn around
	if is_on_wall():
		direction = direction * -1
		$RayCast2D.position.x *= -1
		
	#if on ledge and no longer touching ground, turn around
	if $RayCast2D.is_colliding() == false:
		direction = direction * -1
		$RayCast2D.position.x *= -1
		
	if get_slide_count() > 0:
		for i in range(get_slide_count()):
			if "Player" in get_slide_collision(i).collider.name:
				get_slide_collision(i).collider.dead()
				
	

#Method to knockback the enemy when they are hit
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
