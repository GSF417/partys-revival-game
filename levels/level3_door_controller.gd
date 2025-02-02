extends Node2D

@onready var anim_player = $AnimationPlayer

var open : bool = false
var enable_count : int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	anim_player.play("starting_position")

func enable():
	enable_count = enable_count + 1
	if enable_count == 2:
		anim_player.play("move_out")

func disable():
	if enable_count == 2:
		anim_player.play("move_back")
	enable_count = enable_count - 1
	
