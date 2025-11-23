extends PlayerStateBase

# Called when entering the move state
func _enter() -> void:
	# Update debug label
	update_debug_label("Move")
	
	# Start run animation immediately for responsive feedback
	play_animation(get_animation_name("run"))


# Called every physics frame while in move state
func _update(delta: float) -> void:
	# Get input direction
	input_direction = Input.get_vector("left", "right", "up", "down")
	
	# Apply movement with acceleration
	player.velocity = player.velocity.lerp(input_direction * SPEED, ACCELERATE * delta)
	player.move_and_slide()
	
	# Determine animation based on velocity
	var action = "run" if player.velocity.length() > 50 else "idle"
	play_animation(get_animation_name(action))
	
	# Transition to idle state if no input
	if input_direction == Vector2.ZERO:
		dispatch("idle")


# Called when exiting the move state
func _exit() -> void:
	pass
