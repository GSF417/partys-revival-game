extends CharacterBody2D
class_name HeroEntity

@onready var sprite = $Sprite2D

@export var jump_sfx : AudioStreamPlayer
@export var hero_ability : HeroAbility


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var SPEED : int = 225
var jump_height : int = -600

var direction = 0
var lookLeft = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	sprite.flip_h = lookLeft
	if not is_on_floor():
		velocity.y += gravity * delta
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()

func move():
	direction = Input.get_axis("MoveLeft", "MoveRight")
	if direction == -1:
		lookLeft = true
	elif direction == 1:
		lookLeft = false

func jump():
	# Handle jump.
	if Input.is_action_just_pressed("MoveUp") and is_on_floor():
		#jump_sfx.play()
		velocity.y = jump_height

func useAbility():
	if hero_ability != null and Input.is_action_just_pressed("ExecuteAction"):
		hero_ability.execute(lookLeft)

func checkForActions():
	move()
	jump()
	useAbility()
