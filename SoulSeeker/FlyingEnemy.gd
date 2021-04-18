extends KinematicBody2D

var GRAVITY = 0
const FLOOR = Vector2(0, -1)

var velocity = Vector2()
var direction = 1
var is_dead = false
var path

export(int) var speed = 30
export(int) var hp = 1
export(Vector2) var size = Vector2(1,1)

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
		GRAVITY = 10
		velocity.y += GRAVITY
		move_and_slide(velocity, FLOOR)
		
		$AnimatedSprite.play("hit")
		$CollisionShape2D.call_deferred("set_disabled", true)
		$RayCast2D.call_deferred("set_disabled", true)
		$Timer.start()

func _physics_process(delta):
	
	if is_dead == false:
	
		if direction == 1:
			$AnimatedSprite.flip_h = false
		else:
			$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("walk")
		
		var obj = get_parent().get_node("Player")
		var dir = (obj.global_position - global_position).normalized() #get player poistion relative to enemy position
		velocity = dir * speed
		move_and_collide(dir * speed * delta)
		
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
	queue_free() #realease enemy

