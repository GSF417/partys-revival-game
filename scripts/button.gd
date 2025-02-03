extends Node2D

@export var target : Node2D
@onready var detection_range = $DetectionRange
@onready var anim_player = $AnimationPlayer

var interacting_with : int = 0

func _process(delta: float) -> void:
	pass

func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body is HeroTobu or body is RigidBody2D:
		anim_player.play("active")
		if interacting_with == 0 and target.has_method("enable"):
			target.enable()
		interacting_with = interacting_with + 1

func _on_body_shape_exited(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body is HeroTobu or body is RigidBody2D:
		interacting_with = interacting_with - 1
	if interacting_with <= 0:
		interacting_with = 0
		anim_player.play("inactive")
		if target == null:
			pass
		elif target.has_method("disable"):
			target.disable()
