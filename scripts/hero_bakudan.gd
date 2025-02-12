extends HeroEntity

@onready var ghost_scene = load("res://scenes/heroes/ghost_bakudan.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	SPEED = 225
	jump_height = -450

func die() -> void:
	super.die()
	$BakudanAbility.execute(lookLeft)

func _on_cleanup_timer_timeout() -> void:
	var ghost_instance = ghost_scene.instantiate()
	ghost_instance.global_position = global_position
	main.add_child(ghost_instance)
	queue_free()
