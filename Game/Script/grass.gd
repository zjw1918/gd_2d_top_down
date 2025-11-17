extends Area2D

var skew_tween: Tween
var skew_tween_back: Tween

var scale_tween: Tween
var start_scale = Vector2.ONE
var end_scale = Vector2(1.0, 0.5)

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
func _process(_delta: float) -> void:
	pass


func _on_body_entered(_body: Node2D) -> void:
	animate_scale(end_scale, 0.1)

func _on_body_exited(_body: Node2D) -> void:
	animate_scale(start_scale, 0.5)

func animate_scale(pos: Vector2,  duration: float) -> void:
	if scale_tween:
		scale_tween.kill()
	
	scale_tween = get_tree().create_tween()
	scale_tween.tween_property(sprite_2d, "scale", pos, duration)
	scale_tween.set_ease(Tween.EASE_OUT)
