extends Node2D
class_name LeverObject

@export var target : Node2D
@onready var sprite = $AnimatedSprite2D
@onready var sprite_arrow = $Arrow

var nearby_heroes = 0
var activated = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	if nearby_heroes > 0 and not activated:
		sprite_arrow.visible = true
	else:
		sprite_arrow.visible = false

func interact() -> void:
	sprite.play("activated")
	activated = true
	if target == null:
		return
	if target.has_method("trigger"):
		target.trigger()

func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body is HeroEntity:
		nearby_heroes = nearby_heroes + 1
		body.addInteractable(self)


func _on_area_2d_body_shape_exited(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body is HeroEntity:
		nearby_heroes = nearby_heroes - 1
		body.removeInteractable(self)
