extends Node2D

@export var to_trigger : Array[Node2D]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func trigger() -> void:
	for object in to_trigger:
		object.trigger()
