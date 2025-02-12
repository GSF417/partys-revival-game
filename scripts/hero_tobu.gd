extends HeroEntity
class_name HeroTobu

@onready var hitbox_component = $HitboxComponent
@onready var ghost_scene = load("res://scenes/heroes/ghost_tobu.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	SPEED = 225
	jump_height = -620

func _process(delta: float) -> void:
	if velocity.y > 10:
		hitbox_component.monitorable = true
	else:
		hitbox_component.monitorable = false

func attack_recoil() -> void:
	velocity.y = jump_height * 1.75


func _on_timer_timeout() -> void:
	var ghost_instance = ghost_scene.instantiate()
	ghost_instance.global_position = global_position
	main.add_child(ghost_instance)
	queue_free()
