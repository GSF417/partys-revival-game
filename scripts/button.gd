extends Node2D

@export var target : Node2D
@onready var detection_range = $DetectionRange
@onready var anim_player = $AnimationPlayer

var active : bool = false

func _process(delta: float) -> void:
	if detection_range == null:
		return
	if detection_range.heroes_count() > 0:
		active = true
		anim_player.play("active")
	else:
		active = false
		anim_player.play("inactive")
