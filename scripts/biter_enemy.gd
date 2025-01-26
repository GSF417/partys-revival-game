extends CharacterBody2D
class_name BiterEnemy

var SPEED = 300
var JUMP_HEIGHT = -450

var dead = false
var moving = false
var jumping = false
var direction = Vector2(0,0)
var lookLeft = false
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@export var does_not_jump : bool
@export var stays_in_place : bool

@onready var animation_tree = $AnimationTree
@onready var hitbox_component_col = $HitboxComponent/CollisionShape2D
@onready var detection_range = $DetectionRange
@onready var timer = $Timer
@onready var sprite = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func chase(target: HeroEntity):
	direction = position.direction_to(detection_range.lastToEnter.position)
	if not stays_in_place:
		moving = true
	if direction.x < 0:
		lookLeft = false
	elif direction.x >= 0:
		lookLeft = true
	if direction.y < -0.4 and not does_not_jump:
		jumping = true
	else:
		jumping = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if detection_range == null:
		return
	var nearby_heroes = detection_range.nearby_heroes
	if nearby_heroes > 0 and not dead:
		chase(detection_range.lastToEnter)
	else:
		direction.x = 0
		
func _physics_process(delta: float) -> void:
	sprite.flip_h = lookLeft
	animation_tree.set("parameters/conditions/idle", !moving)
	animation_tree.set("parameters/conditions/moving", moving)
	animation_tree.set("parameters/conditions/dead", dead)
	if moving:
		velocity.x = direction.x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if not is_on_floor():
		velocity.y += gravity * delta
	elif jumping:
		velocity.y = JUMP_HEIGHT
	move_and_slide()

func die() -> void:
	moving = false
	dead = true
	hitbox_component_col.disabled = true
	timer.start()

func _on_timer_timeout() -> void:
	queue_free()
