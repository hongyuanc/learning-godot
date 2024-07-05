extends Area2D

var player: AnimatedSprite2D

func _ready():
	player = get_node("/root/Game/Player/AnimatedSprite2D")
	print("In _ready(): Player node: ", player)
	
	# Ensure the body_entered signal is connected
	if not is_connected("body_entered", _on_body_entered):
		connect("body_entered", _on_body_entered)
	
	print("body_entered signal connected: ", is_connected("body_entered", _on_body_entered))

func _on_body_entered(body):
	print("Body entered: ", body)
	if player:
		print("Attempting to play 'dead' animation")
		if "dead" in player.sprite_frames.get_animation_names():
			player.play("dead")
			print("'dead' animation started")
		else:
			print("No 'dead' animation found in SpriteFrames")
	else:
		print("Player node is null in _on_body_entered")

	print("You died")
	Engine.time_scale = 0.9
	$Timer.start()

func _on_timer_timeout():
	print("Timer timeout reached")
	Engine.time_scale = 1
	get_tree().reload_current_scene()

# Add this function to check collisions manually
func _physics_process(delta):
	for body in get_overlapping_bodies():
		if body.is_in_group("player"):  # Make sure your player is in the "player" group
			print("Collision detected in _physics_process")
			_on_body_entered(body)
			set_physics_process(false)  # Stop checking after first collision
