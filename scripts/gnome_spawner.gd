extends Node2D

@export var ammunition : int
@export var travel_dir : int
@export var spawn_offset : Vector2

@onready var root = get_tree().get_root().get_child(0)
@onready var gnome = load("res://scenes/enemies/gnome.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func trigger() -> void:
	if ammunition > 0:
		var instance = gnome.instantiate()
		instance.global_position = global_position + spawn_offset
		root.add_child.call_deferred(instance)
		ammunition = ammunition - 1
