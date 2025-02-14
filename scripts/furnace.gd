extends Node2D

@export var target : Node2D
@onready var sprite = $AnimatedSprite2D
@onready var sinal = $Sinal
@onready var light = $PointLight2D
@onready var detection_range = $DetectionRange
@onready var ghost_scene = load("res://scenes/heroes/ghost_kinroy.tscn")
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
	if source is not HeroKinroy:
		return
	if target == null:
		return
	#source.queue_free()
	if target.has_method("trigger") && activated == false:
		light.visible = true
		sprite.play("activated")
		var ghost_instance = ghost_scene.instantiate()
		ghost_instance.global_position = global_position
		source.main.add_child(ghost_instance)
		source.queue_free()
		target.trigger()
		activated = true
