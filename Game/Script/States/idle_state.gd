extends PlayerStateBase

# Called when entering the idle state
func _enter() -> void:
	# Update debug label
	update_debug_label("Idle")
	
	# Play idle animation immediately for responsive feedback
	play_animation(get_animation_name("idle"))


# Called every physics frame while in idle state
func _update(delta: float) -> void:
	# Get input direction
	input_direction = Input.get_vector("left", "right", "up", "down")
	
	# Apply deceleration
	player.velocity = player.velocity.lerp(Vector2.ZERO, ACCELERATE * delta)
	player.move_and_slide()
	
	# Update animation based on current facing direction
	play_animation(get_animation_name("idle"))
	
	# Transition to move state if there's input
	if input_direction != Vector2.ZERO:
		dispatch("move")


# Called when exiting the idle state
func _exit() -> void:
	pass
