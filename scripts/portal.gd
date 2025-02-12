extends Node2D

@export var target_point : Vector2
@onready var arrow : Sprite2D = $Arrow
@onready var detection_range = $DetectionRange

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("swirling")

func _process(delta: float) -> void:
	if detection_range.heroes_count() > 0:
		arrow.visible = true
	else:
		arrow.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func interact(source: Node2D) -> void:
	source.global_position = target_point
