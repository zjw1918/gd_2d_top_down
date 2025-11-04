extends CharacterBody2D

const SPEED = 200
const ACCELERATE = 15

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("left","right", "up","down")
	
	velocity = velocity.lerp(direction * SPEED, ACCELERATE * delta)
	move_and_slide()
