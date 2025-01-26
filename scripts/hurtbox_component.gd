extends Area2D
class_name HurtboxComponent

@export var health_component : HealthComponent
@export var fire_invulnerable : bool
@export var hero : bool
@export var enemy : bool
@export var cut_invulnerable : bool
@export var explosion_invulnerable : bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_area_entered(area: Area2D) -> void:
	if not area.is_in_group("Damage"):
		return
	if area.is_in_group("Hero_Attack") and hero:
		return
	if area.is_in_group("Enemy_Attack") and enemy:
		return
	if area.is_in_group("Burning") and fire_invulnerable:
		return
	if area.is_in_group("Cut_Attack") and cut_invulnerable:
		return
	if area.is_in_group("Explosion") and explosion_invulnerable:
		return
	health_component.suffer_damage()
