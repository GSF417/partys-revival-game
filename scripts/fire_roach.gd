extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var detection_range = $DetectionRange
@onready var timer = $Timer

var dying : bool = false
var attacking : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	if not is_on_floor() and not dying:
		velocity.y += gravity * delta
	else:
		velocity.y = 0
	move_and_slide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if detection_range == null:
		return
	if detection_range.heroes_count() > 0:
		attacking = true
		timer.start()

func die() -> void:
	dying = true
	$CleanupTimer.start()

func _on_timer_timeout() -> void:
	attacking = false

func _on_cleanup_timer_timeout() -> void:
	queue_free()
