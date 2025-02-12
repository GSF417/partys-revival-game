extends Node
class_name HealthComponent

@export var MAX_HEALTH : int = 2
@export var health_bar : ProgressBar
@export var flash_player : AnimationPlayer

var health : float

# Called when the node enters the scene tree for the first time.
func _ready():
	health = MAX_HEALTH

func suffer_damage():
	var parent = get_parent()
	health -= 2
	if health_bar != null:
		health_bar.set_health(health)
	if flash_player != null:
		flash_player.play("hit_flash")
	if health > 0:
		return
	if parent.has_method("die"):
		parent.die()
	else:
		parent.queue_free()
