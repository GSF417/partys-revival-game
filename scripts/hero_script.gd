extends CharacterBody2D
class_name HeroEntity

@onready var sprite = $Sprite2D

@export var ability_sfx : AudioStreamPlayer2D
@export var jump_sfx : AudioStreamPlayer2D
@export var hero_ability : HeroAbility
@export var cleanup_timer : Timer
@export var ability_timer : Timer

@onready var main = get_tree().get_root().get_node("Main")
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var SPEED : int = 225
var jump_height : int = -600
var push_force : float = 80.0

var direction = 0
var lookLeft = false

var interactables_list = []
var interactables_num = 0

var moving : bool = false
var jumping : bool = false
var dying : bool = false
var using_ability : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	sprite.flip_h = lookLeft
	if dying:
		return
	if not is_on_floor():
		velocity.y += gravity * delta
		jumping = true
	else:
		jumping = false
	if direction:
		velocity.x = direction * SPEED
		moving = true
	else:
		moving = false
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
	
	# To collide with Rigid Bodies
	for i in get_slide_collision_count():
		var c = get_slide_collision(i)
		if c.get_collider() is RigidBody2D:
			c.get_collider().apply_central_impulse(-c.get_normal() * push_force)

func halt_movement():
	direction = 0

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
		if jump_sfx != null:
			jump_sfx.play()

func addInteractable(interactable):
	if interactable.has_method("interact"):
		interactables_num = interactables_num + 1
		interactables_list.append(interactable)

func removeInteractable(interactable):
	if interactable.has_method("interact"):
		interactables_num = interactables_num - 1
		interactables_list.erase(interactable)
	
func interactWithAll():
	for interactable in interactables_list:
		interactable.interact(self)

func useAbility():
	if interactables_num > 0 and Input.is_action_just_pressed("ExecuteAction"):
		interactWithAll()
	elif hero_ability != null and Input.is_action_just_pressed("ExecuteAction"):
		hero_ability.execute(lookLeft)
		if ability_sfx != null:
			ability_sfx.play()
		using_ability = true
		if ability_timer != null:
			ability_timer.start()

func die():
	if dying:
		return
	dying = true
	cleanup_timer.start()

func checkForActions():
	if dying:
		return
	move()
	jump()
	useAbility()
