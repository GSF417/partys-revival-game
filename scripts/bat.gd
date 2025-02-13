extends CharacterBody2D

const SPEED = 4
@export var roaming_range : int
@onready var burning_detection : BurningDetectionRange = $BurningDetection
var rng = RandomNumberGenerator.new()
var starting_pos : Vector2
var target_pos : Vector2

var dying : bool = false

func _ready() -> void:
	rng.randomize()
	find_new_pos()
	starting_pos = position
	$Timer.start()

func find_new_pos() -> void:
	target_pos = (starting_pos + Vector2(rng.randi_range(-100, 100), rng.randi_range(-100, 100)) - position).normalized()

func flee_from_burning(burning_source: Node2D) -> void:
	target_pos = (position - burning_source.position).normalized()

func _process(delta: float) -> void:
	var burning_source = burning_detection.get_burning_source()
	if burning_source != null:
		flee_from_burning(burning_source)
	elif burning_detection.heroes_count() > 0:
		target_pos = (burning_detection.last_to_enter().position - position).normalized()

func _physics_process(delta: float) -> void:
	if position.distance_to(target_pos) > 3:
		move_and_collide(target_pos * SPEED)

func _on_timer_timeout() -> void:
	if burning_detection.heroes_count() > 0 or burning_detection.get_burning_source() != null:
		$Timer.start()
		return
	find_new_pos()
	$Timer.start()

func die() -> void:
	dying = true
	$CleanupTimer.start()

func _on_cleanup_timer_timeout() -> void:
	queue_free()
