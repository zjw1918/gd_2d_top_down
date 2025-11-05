extends CharacterBody2D

const SPEED = 200
const ACCELERATE = 15

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


var m_input_direction: Vector2 = Vector2.ZERO
var m_facing_direction: String = "down"

func _physics_process(delta: float) -> void:
	m_input_direction = Input.get_vector("left","right", "up","down")
	
	velocity = velocity.lerp(m_input_direction * SPEED, ACCELERATE * delta)
	move_and_slide()
	
	var animation_to_play: String
	
	if velocity.length() > 50:
		animation_to_play = "run_" + get_direction_name()
	else:
		animation_to_play = "idle_" + get_direction_name()
	
	animated_sprite_2d.play(animation_to_play)
	#print(animation_to_play)
		

func get_direction_name() -> String:
	if m_input_direction == Vector2.ZERO:
		return m_facing_direction
		
	if m_input_direction.y > 0:
		m_facing_direction = "down"
	elif m_input_direction.y < 0:
		m_facing_direction = "up"
	else:
		if m_input_direction.x > 0:
			m_facing_direction = "right"
		elif m_input_direction.x < 0:
			m_facing_direction = "left"
	
	return m_facing_direction
