extends LimboState
class_name PlayerStateBase

# Shared constants
const SPEED = 200
const ACCELERATE = 15

# References to player components
var player: CharacterBody2D
var animated_sprite: AnimatedSprite2D

# Shared state data
var input_direction: Vector2 = Vector2.ZERO
var facing_direction: String = "down"


func _setup() -> void:
	# Get references when state machine initializes
	player = agent as CharacterBody2D
	if player:
		animated_sprite = player.get_node("AnimatedSprite2D")


# Update debug label with current state name
func update_debug_label(state_name: String) -> void:
	if player and player.has_node("DebugLabel"):
		var label = player.get_node("DebugLabel") as Label
		if label:
			label.text = "State: " + state_name



# Helper function to get direction name based on input
func get_direction_name() -> String:
	if input_direction == Vector2.ZERO:
		return facing_direction
		
	if input_direction.y > 0:
		facing_direction = "down"
	elif input_direction.y < 0:
		facing_direction = "up"
	else:
		if input_direction.x > 0:
			facing_direction = "right"
		elif input_direction.x < 0:
			facing_direction = "left"
	
	return facing_direction


# Helper function to get full animation name
func get_animation_name(action: String) -> String:
	return action + "_" + get_direction_name()


# Helper function to play animation
func play_animation(animation_name: String) -> void:
	if animated_sprite:
		animated_sprite.play(animation_name)
