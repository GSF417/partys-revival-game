extends Node2D

@export var target : Node2D
@onready var anim_player = $AnimationPlayer

func _ready() -> void:
	anim_player.play("active")

func trigger():
	anim_player.play("inactive")
	if target.has_method("trigger"):
		target.trigger()
