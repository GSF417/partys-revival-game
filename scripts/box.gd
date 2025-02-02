extends RigidBody2D

@export var supported_by : Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	if supported_by == null:
		self.freeze = false
