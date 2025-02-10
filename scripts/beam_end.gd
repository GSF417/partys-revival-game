extends Node2D

@onready var beam_middle = load("res://scenes/enemies/enemy_attacks/beam_middle.tscn")
@onready var main = get_tree().get_root().get_node("Main")

@export var move_speed : float
@export var move_dir : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position = global_position + Vector2(move_speed * move_dir * delta, 0)

func _on_death_timer_timeout() -> void:
	queue_free()

func _on_extender_timer_timeout() -> void:
	var instance = beam_middle.instantiate()
	instance.global_position = global_position - Vector2(18 * move_dir, 0)
	main.add_child(instance)
	$ExtenderTimer.start()
