extends Node2D
class_name LeverObject

@export var target : Node2D
@export var reenables : bool
@onready var sprite = $AnimatedSprite2D
@onready var sprite_arrow = $Arrow
@onready var detection_range = $DetectionRange

var activated = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	if detection_range == null:
		return
	var nearby_heroes = detection_range.heroes_count()
	if nearby_heroes > 0 and not activated:
		sprite_arrow.visible = true
	else:
		sprite_arrow.visible = false

func interact() -> void:
	if activated:
		return
	if reenables:
		$Timer.start()
	sprite.play("activated")
	activated = true
	if target == null:
		return
	if target.has_method("trigger"):
		target.trigger()

func _on_timer_timeout() -> void:
	activated = false
	sprite.play("default")
