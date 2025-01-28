extends Node2D

@onready var detection_range = $DetectionRange
@onready var attack_range = $AttackRange

var detected_hero : bool = false
var attacking : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if attack_range.heroes_count() > 0:
		attacking = true
	elif detection_range.heroes_count() > 0:
		detected_hero = true
	else:
		attacking = false
		detected_hero = false
