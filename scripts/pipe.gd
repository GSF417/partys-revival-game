extends Node2D
class_name Pipe

@export var target : Node2D
@onready var sprite = $AnimatedSprite2D
@onready var sinal = $Sinal
@onready var detection_range = $DetectionRange

var selected_hero = 0
var activated = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sinal.visible = false

func _process(delta: float) -> void:
	if detection_range.heroes_count() > 0 and not activated:
		sinal.visible = true
	else:
		sinal.visible = false

func interact(source: Node2D) -> void:
	if source is not HeroYari:
		return
	if target == null:
		return
	if target.has_method("trigger") && activated == false:
		sprite.play("activated")
		target.trigger()
		activated = true
