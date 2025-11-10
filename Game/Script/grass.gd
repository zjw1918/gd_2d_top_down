extends Area2D

var skew_tween: Tween
var skew_tween_back: Tween

@onready var sprite_2d_back: Sprite2D = $Sprite2DBack
@onready var sprite_2d: Sprite2D = $Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var start_skew = deg_to_rad(randf_range(6, 10))
	var end_skew = -start_skew
	
	skew_tween = get_tree().create_tween().set_loops()
	
	skew_tween.tween_property(sprite_2d,"skew", end_skew, 1.5).from(start_skew)
	skew_tween.tween_property(sprite_2d,"skew", start_skew, 1.5)
	skew_tween.set_ease(Tween.EASE_IN_OUT)
	
	var start_skew_back = end_skew * 0.5
	var end_skew_back = -start_skew_back
	
	
	skew_tween_back = get_tree().create_tween().set_loops()
	
	skew_tween_back.tween_property(sprite_2d_back,"skew", end_skew_back, 1.5).from(start_skew_back)
	skew_tween_back.tween_property(sprite_2d_back,"skew", start_skew_back, 1.5)
	skew_tween_back.set_ease(Tween.EASE_IN_OUT)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
