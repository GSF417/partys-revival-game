extends Area2D

var nearby_heroes = 0
var lastToEnter : HeroEntity

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body is HeroEntity:
		lastToEnter = body
		nearby_heroes = nearby_heroes + 1
		body.addInteractable(self)

func _on_body_shape_exited(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body is HeroEntity:
		nearby_heroes = nearby_heroes - 1
		body.removeInteractable(self)
	if nearby_heroes <= 0:
		nearby_heroes = 0
		lastToEnter = null
