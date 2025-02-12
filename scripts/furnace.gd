extends Node2D

@export var target : Node2D
@onready var sprite = $AnimatedSprite2D
@onready var sprite_arrow = $Arrow
@onready var light = $PointLight2D
@onready var detection_range = $DetectionRange
var activated = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func interact(source: Node2D) -> void:
	if source is not HeroKinroy:
		return
	if target == null:
		return
	source.queue_free()
	if target.has_method("trigger") && activated == false:
		target.trigger()
	activated = true
