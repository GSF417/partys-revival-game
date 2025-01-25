extends CharacterBody2D
class_name BiterEnemy

var SPEED = 300
var JUMP_HEIGHT = -450

var dead = false
var moving = false
var jumping = false
var direction = 0
var lookLeft = false
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

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
	if direction.y < -0.4:
		jumping = true
	else:
		jumping = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if detection_range == null:
		return
	var nearby_heroes = detection_range.nearby_heroes
	if nearby_heroes > 0 and not dead:
		moving = true
		chase(detection_range.lastToEnter)
	else:
		direction = 0
		
func _physics_process(delta: float) -> void:
	sprite.flip_h = lookLeft
	if direction:
		print(direction)
		velocity.x = direction.x * SPEED
	if not is_on_floor():
		velocity.y += gravity * delta
	elif jumping:
		velocity.y = JUMP_HEIGHT
	move_and_slide()

func die() -> void:
	moving = false
	dead = true
	timer.start()

func _on_timer_timeout() -> void:
	queue_free()
