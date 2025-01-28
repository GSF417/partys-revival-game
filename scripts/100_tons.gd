extends RigidBody2D

@export var supported_by : Node2D
@onready var hitbox_component = $HitboxComponent

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	if supported_by == null:
		self.freeze = false
	if linear_velocity.y > 10:
		hitbox_component.monitorable = true
	else:
		hitbox_component.monitorable = false
	
