extends Sprite2D


@export var grass_rects: Array[Rect2] = [
	Rect2(0, 0, 48, 32),
	Rect2(0, 32, 48, 32),
	Rect2(0, 64, 48, 32),
]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if grass_rects.is_empty():
		return

	randomize()
	var rand_val = randf()
	if rand_val < 0.5: # 50% chance for the first element
		region_rect = grass_rects[0]
	else:
		# 50% chance for the rest of the elements, distributed evenly
		if grass_rects.size() > 1:
			var index = randi_range(1, grass_rects.size() - 1)
			region_rect = grass_rects[index]
		else:
			region_rect = grass_rects[0] # Fallback to first element
