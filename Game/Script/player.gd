extends CharacterBody2D

# References
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var hsm: LimboHSM = $LimboHSM
@onready var idle_state: LimboState = $LimboHSM/IdleState
@onready var move_state: LimboState = $LimboHSM/MoveState

# Debug label (optional - for visual debugging)
@onready var debug_label: Label = $DebugLabel if has_node("DebugLabel") else null

# State data - accessed by states
var facing_direction: String = "down"


func _ready() -> void:
	# Set up state transitions
	hsm.add_transition(idle_state, move_state, "move")
	hsm.add_transition(move_state, idle_state, "idle")
	
	# Set initial state
	hsm.initial_state = idle_state
	
	# Initialize and activate the state machine
	hsm.initialize(self)
	hsm.set_active(true)
