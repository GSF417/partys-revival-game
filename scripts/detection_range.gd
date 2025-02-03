extends Area2D
class_name DetectionRangeComponent

@export var interactable : bool
@export var triggerable : Node2D
var list_of_heroes = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func heroes_count() -> int:
	return list_of_heroes.size()

func last_to_enter() -> Node2D:
	return list_of_heroes[list_of_heroes.size() - 1]

func check_body_entered(body: Node2D):
	if body is HeroEntity:
		$Timer.start()
		if triggerable:
			triggerable.trigger()
		list_of_heroes.append(body)
		if interactable:
			body.addInteractable(get_parent())

func check_body_exited(body: Node2D):
	if body is HeroEntity:
		list_of_heroes.erase(body)
		if interactable:
			body.removeInteractable(get_parent())

func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	check_body_entered(body)

func _on_body_shape_exited(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	check_body_exited(body)

func _on_timer_timeout() -> void:
	if list_of_heroes.size() > 0:
		list_of_heroes = list_of_heroes.filter(func(element): return is_instance_valid(element))
