extends Node
class_name HealthComponent

@export var character : Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func suffer_damage():
	character.queue_free()
