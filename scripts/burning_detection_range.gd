extends DetectionRangeComponent
class_name BurningDetectionRange

var burning_detected : Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func get_burning_source() -> Node2D:
	return burning_detected

func check_body_entered(body: Node2D):
	if body is HeroEntity:
		$Timer.start()
		if triggerable:
			triggerable.trigger()
		list_of_heroes.append(body)
		if interactable:
			body.addInteractable(get_parent())
	if body is HeroKinroy:
		burning_detected = body

func check_body_exited(body: Node2D):
	if body is HeroEntity:
		list_of_heroes.erase(body)
		if interactable:
			body.removeInteractable(get_parent())
	if body is HeroKinroy:
		burning_detected = null
