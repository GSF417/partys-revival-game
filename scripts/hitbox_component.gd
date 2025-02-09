extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func damage_occurred() -> void:
	print("Damage occurred!")
	if get_parent().has_method("attack_recoil"):
		get_parent().attack_recoil()
