extends Area2D

@onready var timer = $Timer
@onready var player = $"../Player"

func _ready():
	print("Player node: ", player)

func _on_body_entered(body):
	print("You died")
	Engine.time_scale = 0.9
	body.get_node("CollisionShape2D").queue_free()
	
	timer.start()
	

func _on_timer_timeout():
	Engine.time_scale = 1
	get_tree().reload_current_scene()
