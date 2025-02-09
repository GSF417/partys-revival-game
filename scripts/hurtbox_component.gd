extends Area2D
class_name HurtboxComponent

@export var health_component : HealthComponent
@export var fire_invulnerable : bool
@export var hero : bool
@export var enemy : bool
@export var cut_invulnerable : bool
@export var explosion_invulnerable : bool
@export var spike_invulnerable : bool
@export var jump_vulnerable : bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_area_entered(area: Area2D) -> void:
	if not area.is_in_group("Damage"):
		#print("Not damage")
		return
	if area.is_in_group("Hero_Attack") and hero:
		#print("Hero meets hero")
		return
	if area.is_in_group("Enemy_Attack") and enemy:
		#print("Enemy meets enemy")
		return
	if area.is_in_group("Burning") and fire_invulnerable:
		#print("Fire invulnerable")
		return
	if area.is_in_group("Cut_Attack") and cut_invulnerable:
		#print("Cut invulnerable")
		return
	if area.is_in_group("Explosion") and explosion_invulnerable:
		#print("Explosion invulnerable")
		return
	if area.is_in_group("Spike_Attack") and spike_invulnerable:
		#print("Spike invulnerable")
		return
	if area.is_in_group("Jump_Attack") and not jump_vulnerable:
		#print("Jump invulnerable")
		return
	if area.has_method("damage_occurred"):
		area.damage_occurred()
	health_component.suffer_damage()
