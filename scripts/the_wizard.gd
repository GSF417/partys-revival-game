extends Node2D

@onready var beam_root = load("res://scenes/enemies/enemy_attacks/beam_root.tscn")
@onready var beam_start = load("res://scenes/enemies/enemy_attacks/beam_start.tscn")
@onready var beam_end = load("res://scenes/enemies/enemy_attacks/beam_end.tscn")
@onready var main = get_tree().get_root().get_node("Main")
@onready var anim_player = $AnimationPlayer
@export var movement_points : Array[Vector2]

var own_beam_root = null
var MOVE_SPEED : float = 1.5
var target_index : int = 0
var moving : bool = false
var charging_up : bool = false
var cross_count : int = 0
var right_side : bool = true
var going_reverse : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	anim_player.play("idle")

func _physics_process(delta: float) -> void:
	if global_position.distance_to(movement_points[get_target_index()])> 4:
		global_position = global_position.lerp(movement_points[get_target_index()], delta * MOVE_SPEED)
		$MoveTimer.start()
	else:
		global_position = movement_points[get_target_index()]
		moving = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !right_side && !moving:
		scale.x = 1
	elif right_side && !moving:
		scale.x = -1
	if charging_up && own_beam_root == null:
		$ChargingTimer.start()
		manage_beam_root()

func manage_beam_root() -> void:
	var x_pos = 24
	if right_side:
		x_pos = -x_pos
	if own_beam_root == null:
		own_beam_root = beam_root.instantiate()
		own_beam_root.global_position = global_position + Vector2(x_pos, 8)
		main.add_child(own_beam_root)

func get_target_index() -> int:
	var true_index = target_index
	if !right_side:
		true_index = true_index + 4
	return true_index

func move_to_next() -> void:
	moving = true
	cross_count = cross_count + 1
	# Wait for the time to cross over to the other side
	# While counter is below, keep moving up or down
	if cross_count >= 4:
		cross_count = 0
		right_side = !right_side
	elif going_reverse:
		target_index = target_index - 1
	else:
		target_index = target_index + 1
	
	# Check if we tried to go above our limit
	# If yes, start going to the opposite direction
	if target_index >= 4:
		going_reverse = true
		target_index = 2
	if target_index < 0:
		going_reverse = false
		target_index = 1

func restart_charge_interval() -> void:
	$ChargeInterval.start()

func _on_move_timer_timeout() -> void:
	if charging_up:
		$MoveTimer.start()
		return
	move_to_next()

func _on_charge_interval_timeout() -> void:
	charging_up = true

func _on_charging_timer_timeout() -> void:
	var start_x = 68
	var end_x = 102
	var move_dir = 1
	if right_side:
		start_x = -start_x
		end_x = -end_x
		move_dir = -move_dir
	var own_beam_start = beam_start.instantiate()
	var own_beam_end = beam_end.instantiate()
	own_beam_start.global_position = global_position + Vector2(start_x, 0)
	own_beam_start.scale.x = move_dir
	own_beam_end.global_position = global_position + Vector2(end_x, 0)
	own_beam_end.move_dir = move_dir
	own_beam_end.scale.x = move_dir
	main.add_child(own_beam_start)
	main.add_child(own_beam_end)
	main.remove_child(own_beam_root)
	own_beam_root = null
	charging_up = false
	$ChargeInterval.start()
