extends KinematicBody2D

const SPEED = 60
const GRAVITY = 10
const JUMP_POWER = -250
const FLOOR = Vector2(0, -1)
#
const FIREBALL = preload("res://Fireball.tscn")
#
var velocity = Vector2()
var on_ground = false
var is_dead = false

func _physics_process(delta):

	if is_dead == false:

		if Input.is_action_pressed("ui_right"): #Move right functionality
			velocity.x = SPEED
			if on_ground == true:
				$AnimatedSprite.play("run")
			$AnimatedSprite.flip_h = false
			if sign($Position2D.position.x) == -1:
				$Position2D.position.x *= -1
		elif Input.is_action_pressed("ui_left"): #Move left functionality
			velocity.x = -SPEED
			if on_ground == true:
				$AnimatedSprite.play("run")
			$AnimatedSprite.flip_h = true
			if sign($Position2D.position.x) == 1:
				$Position2D.position.x *= -1
		else: #if no button pressed
			velocity.x = 0
			$AnimatedSprite.play("idle") 

		if Input.is_action_pressed("ui_up"): #jump functionality
			if on_ground == true:
				var sound = $AudioStreamPlayer2D2
				sound.play()
				velocity.y = JUMP_POWER
				on_ground = false

		if Input.is_action_just_pressed("ui_select"): #Shoot functionality
			var fireball = FIREBALL.instance()
			var sound = $AudioStreamPlayer2D
			sound.play()
			if sign($Position2D.position.x) == 1:
				fireball.set_fireball_direction(1)
			else:
				fireball.set_fireball_direction(-1)
			get_parent().add_child(fireball)
			fireball.position = $Position2D.global_position

		velocity.y += GRAVITY

		if is_on_floor():
			on_ground = true
		else:
			on_ground = false
			if velocity.y < 0:
				$AnimatedSprite.play("jump")
			else:
				$AnimatedSprite.play("jump")

		velocity = move_and_slide(velocity, FLOOR)

		if get_slide_count() > 0:
			for i in range(get_slide_count()):
				if "Enemy" in get_slide_collision(i).collider.name:
					get_slide_collision(i).collider
					dead()
					
		if get_slide_count() > 0:
			for i in range(get_slide_count()):
				if "Enemy" in get_slide_collision(i).collider.name:
					get_slide_collision(i).collider
					dead()
		
func dead():
	is_dead = true
	velocity = Vector2(0, 0)
	$AnimatedSprite.play("dead")
	#$AnimatedSprite.flip_v = true
	GameDataManager.setStarsToZero()
	$CollisionShape2D.call_deferred("set_disabled", true)
	$Timer.start()


func _on_Timer_timeout():
	get_tree().reload_current_scene()
