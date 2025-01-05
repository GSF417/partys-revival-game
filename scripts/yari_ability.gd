extends HeroAbility

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func execute(lookLeft: bool):
	var inst = YariSlash.createSlash(lookLeft)
	get_parent().add_child(inst)
