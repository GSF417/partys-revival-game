extends HeroEntity
class_name HeroKinroy

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	SPEED = 225
	jump_height = -520

func _on_timer_timeout() -> void:
	queue_free()
