extends Node
class_name HealthComponent

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func suffer_damage():
	get_parent().queue_free()
