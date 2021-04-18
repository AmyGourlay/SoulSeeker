extends Node2D

func _ready():
	set_camera_limits()
	
func set_camera_limits():
	$Player/Camera2D.limit_left = 0
	$Player/Camera2D.limit_right = 2144
	$Player/Camera2D.limit_top = -640
	$Player/Camera2D.limit_bottom = 180
