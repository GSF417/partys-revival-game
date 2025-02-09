extends RigidBody2D

var freed : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	if freed:
		freeze = false

func trigger() -> void:
	freed = true
	print(freed)
