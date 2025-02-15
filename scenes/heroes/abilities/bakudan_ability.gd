extends HeroAbility

@onready var main = get_tree().get_root().get_node("Main")

var executed = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func execute(lookLeft: bool):
	if executed:
		return
	var pos = get_parent().global_position
	var inst = ExplosionEffect.createExplosion(pos)
	executed = true
	main.add_child(inst)
