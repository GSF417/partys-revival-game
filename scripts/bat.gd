extends CharacterBody2D

const SPEED = 2
@export var roaming_range : int
@onready var detection_range = $DetectionRange
var rng = RandomNumberGenerator.new()
var starting_pos : Vector2
var target_pos : Vector2

func _ready() -> void:
	rng.randomize()
	find_new_pos()
	starting_pos = position
	$Timer.start()

func find_new_pos() -> void:
	target_pos = (starting_pos + Vector2(rng.randi_range(-100, 100), rng.randi_range(-100, 100)) - position).normalized()

func _process(delta: float) -> void:
	if detection_range.heroes_count() > 0:
		target_pos = (detection_range.last_to_enter().position - position).normalized()

func _physics_process(delta: float) -> void:
	if position.distance_to(target_pos) > 3:
		move_and_collide(target_pos * SPEED)

func _on_timer_timeout() -> void:
	if detection_range.heroes_count() > 0:
		$Timer.start()
	find_new_pos()
	$Timer.start()
