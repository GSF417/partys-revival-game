extends Node2D

@export var portal : Node2D
@export var ord : int
@onready var sprite = $AnimatedSprite2D
@onready var sinal = $AnimatedSprite2D/Sinal
@onready var light = $AnimatedSprite2D/PointLight2D
@onready var move = $AnimationPlayer
@onready var detection_range = $DetectionRange
var activated = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sinal.visible = false
	move.play("moving")

func _process(delta: float) -> void:
	if detection_range.heroes_count() > 0 and not activated:
		sinal.visible = true
	else:
		sinal.visible = false

func interact(source: Node2D) -> void:
	if source is not HeroKinroy:
		return
	if portal == null:
		return
	if portal.has_method("trigger") && activated == false:
		light.visible = true
		sprite.play("activated")
		portal.trigger(ord)
		activated = true
