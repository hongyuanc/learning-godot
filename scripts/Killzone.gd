extends Area2D

@onready var timer = $Timer
@onready var player = $"../Player/AnimatedSprite2D"


func _on_body_entered(body):
	print("You fell")
	Engine.time_scale = 0.9
	
	timer.start()
	

func _on_timer_timeout():
	Engine.time_scale = 1
	get_tree().reload_current_scene()
