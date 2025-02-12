extends HeroEntity
class_name HeroYari

@onready var ghost_scene = load("res://scenes/heroes/ghost_yari.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	SPEED = 225
	jump_height = -375

func _on_timer_timeout() -> void:
	var ghost_instance = ghost_scene.instantiate()
	ghost_instance.global_position = global_position
	main.add_child(ghost_instance)
	queue_free()

func _on_ability_timer_timeout() -> void:
	using_ability = false
