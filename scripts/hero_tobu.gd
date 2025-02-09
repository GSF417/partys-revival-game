extends HeroEntity
class_name HeroTobu

@onready var hitbox_component = $HitboxComponent

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
