extends Sprite2D


@export var grass_rects: Array[Rect2] = [
	Rect2(0, 0, 48, 32),
	Rect2(0, 32, 48, 32),
	Rect2(0, 64, 48, 32),
]

# Weights for each grass variant (must match grass_rects length)
# Default: 50% for first variant, 25% each for others
@export var grass_weights: Array[float] = [0.5, 0.25, 0.25]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if grass_rects.is_empty():
		return
	
	region_rect = _weighted_random_selection()

func _weighted_random_selection() -> Rect2:
	# Fallback to uniform distribution if weights are invalid
	if grass_weights.is_empty() or grass_weights.size() != grass_rects.size():
		return grass_rects.pick_random()
	
	# Calculate total weight
	var total_weight = 0.0
	for weight in grass_weights:
		total_weight += weight
	
	# Pick random value within total weight range
	var rand_value = randf() * total_weight
	var cumulative = 0.0
	
	# Find which variant the random value falls into
	for i in range(grass_rects.size()):
		cumulative += grass_weights[i]
		if rand_value <= cumulative:
			return grass_rects[i]
	
	# Fallback (should never reach here)
	return grass_rects[0]
