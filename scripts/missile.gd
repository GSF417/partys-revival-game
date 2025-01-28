extends CharacterBody2D

var SPEED = 1000
var spawn_pos : Vector2

@export var travel_dir : int

@onready var main = get_tree().get_root().get_node("Main")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global_position = spawn_pos

func _physics_process(delta: float) -> void:
	velocity = Vector2(SPEED * travel_dir, 0)
	move_and_slide()

func trigger() -> void:
	var pos = global_position
	var inst = ExplosionEffect.createExplosion(pos)
	main.add_child(inst)
	queue_free()

func _on_timer_timeout() -> void:
	trigger()
