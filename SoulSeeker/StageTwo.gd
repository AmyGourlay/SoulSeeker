extends Node2D

func _ready():
	set_camera_limits()
	
func set_camera_limits():
	$Player/Camera2D.limit_left = 0
	$Player/Camera2D.limit_right = 1920
	$Player/Camera2D.limit_top = -288
	$Player/Camera2D.limit_bottom = 180
