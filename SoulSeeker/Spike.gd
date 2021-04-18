extends Area2D

func _ready():
	pass

func _on_Spike_body_entered(body):
	if body.has_method("dead"):
		body.dead()
