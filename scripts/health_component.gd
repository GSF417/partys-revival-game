extends Node
class_name HealthComponent

@export var MAX_HEALTH : int = 2
var health : float

# Called when the node enters the scene tree for the first time.
func _ready():
	health = MAX_HEALTH

func suffer_damage():
	var parent = get_parent()
	health -= 2
	if health > 0:
		return
	if parent.has_method("die"):
		parent.die()
	else:
		parent.queue_free()
		
