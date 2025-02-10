extends Node2D
class_name Furnance

@export var target : Node2D
@export var players : Array[HeroEntity] = [null, null, null, null]
@onready var sprite = $AnimatedSprite2D
@onready var sprite_arrow = $Arrow
@onready var light = $PointLight2D
@onready var detection_range = $DetectionRange

var selected_hero = 0
var activated = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func find_living_hero() -> int:
	var candidate
	for i in range(4):
		candidate = players[i]
		if (candidate != null):
			return i
	return -1

func switch_hero(switch_to: int):
	if switch_to < 0 or switch_to >= 4:
		return
	selected_hero = switch_to
	if (players[selected_hero] == null):
		selected_hero = find_living_hero()
		if (selected_hero == -1):
			return

func _process(delta: float) -> void:
	if Input.is_action_pressed("SwitchFirst"):
		switch_hero(0)
	if Input.is_action_pressed("SwitchSecond"):
		switch_hero(1)
	if Input.is_action_pressed("SwitchThird"):
		switch_hero(2)
	if Input.is_action_pressed("SwitchFourth"):
		switch_hero(3)
	if detection_range == null:
		return
	var nearby_heroes = detection_range.heroes_count()
	#var nearby_heroes = detection_range.nearby_heroes
	#if nearby_heroes > 0 and not activated:
		#sprite_arrow.visible = true
	#else:
		#sprite_arrow.visible = false

func interact(source: Node2D) -> void:
	if selected_hero == 1 && players[1] != null:
		players[1].queue_free()
		players[1] = null
		sprite.play("activated")
		light.visible = true
		if target == null:
			return
		if target.has_method("trigger") && activated == false:
			target.trigger()
		activated = true
