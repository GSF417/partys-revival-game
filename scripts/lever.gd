extends Node2D
class_name LeverObject

@export var target : Node2D
@onready var sprite = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func interact() -> void:
	sprite.play("activated")
	if target == null:
		return
	if target.has_method("trigger"):
		target.trigger()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_class("HeroEntity"):
		body.addInteractable(self)

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_class("HeroEntity"):
		body.removeInteractable(self)
