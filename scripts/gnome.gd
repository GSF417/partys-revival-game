extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@export var interactable : Node2D

var dying : bool = false
var moving : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta
	move_and_slide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func trigger() -> void:
	interactable.interact()

func die():
	dying = true
	$CleanupTimer.start()

func _on_cleanup_timer_timeout() -> void:
	queue_free()
