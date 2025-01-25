extends CharacterBody2D
class_name BiterEnemy

var SPEED = 300

var dead = false
var moving = false
var direction = 0
var lookLeft = false

@onready var detection_range = $DetectionRange
@onready var timer = $Timer
@onready var sprite = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func chase(target: HeroEntity):
	direction = position.direction_to(detection_range.lastToEnter.position)
	if direction.x < 0:
		lookLeft = true
	elif direction.x >= 0:
		lookLeft = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if detection_range == null:
		return
	var nearby_heroes = detection_range.nearby_heroes
	if nearby_heroes > 0 and not dead:
		moving = true
		chase(detection_range.lastToEnter)
		
func _physics_process(delta: float) -> void:
	sprite.flip_h = lookLeft
	if direction:
		print(direction)
		velocity.x = direction.x * SPEED
	move_and_slide()

func die() -> void:
	moving = false
	dead = true
	timer.start()

func _on_timer_timeout() -> void:
	queue_free()
