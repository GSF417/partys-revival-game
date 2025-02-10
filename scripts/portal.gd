extends Node2D

@export var target_point : Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("swirling")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func interact(source: Node2D) -> void:
	source.global_position = target_point
