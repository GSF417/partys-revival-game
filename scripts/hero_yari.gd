extends HeroEntity
class_name HeroYari

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	SPEED = 225
	jump_height = -375

func _on_timer_timeout() -> void:
	queue_free()

func _on_ability_timer_timeout() -> void:
	using_ability = false
