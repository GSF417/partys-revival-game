extends Area2D

@export var interactable : bool
var list_of_heroes = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func heroes_count() -> int:
	return list_of_heroes.size()

func last_to_enter() -> Node2D:
	return list_of_heroes[list_of_heroes.size() - 1]

func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body is HeroEntity:
		list_of_heroes.append(body)
		body.addInteractable(get_parent())

func _on_body_shape_exited(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body is HeroEntity:
		list_of_heroes.erase(body)
		body.removeInteractable(get_parent())
