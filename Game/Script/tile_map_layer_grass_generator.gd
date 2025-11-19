extends TileMapLayer

const GRASS = preload("uid://dk4sv1u1a4fja")
const OFFSET = 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# disable the stub green grass rendering
	enabled = false
	
	var cell_array = get_used_cells()
	var parent_node = get_parent()
	for cell in cell_array:
		var grass: Node2D = GRASS.instantiate()
		grass.global_position = global_position + cell * 32.0 + Vector2(16, 16)
		
		parent_node.add_child.call_deferred(grass)
		
		var random_offset = Vector2(randf_range(-OFFSET, OFFSET), randf_range(-OFFSET, OFFSET))
		grass.global_position += random_offset
		
		grass.get_node("Sprite2D").flip_h = randi_range(0, 1)
		(grass.get_node("Sprite2DBack") as Sprite2D).flip_h = randi_range(0, 1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
