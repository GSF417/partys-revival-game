extends CanvasLayer

@export var hero_controller : HeroesHandler
@onready var tobu_icon = $"ColorRect/1"
@onready var yari_icon = $"ColorRect/2"
@onready var kinroy_icon = $"ColorRect/3"
@onready var bakudan_icon = $"ColorRect/4"
@onready var checkmark = $ColorRect/Checkmark

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var alive_heroes = hero_controller.get_alive()
	if !alive_heroes[0]:
		tobu_icon.self_modulate = Color(0.15, 0.15, 0.15)
	if !alive_heroes[1]:
		yari_icon.self_modulate = Color(0.15, 0.15, 0.15)
	if !alive_heroes[2]:
		kinroy_icon.self_modulate = Color(0.15, 0.15, 0.15)
	if !alive_heroes[3]:
		bakudan_icon.self_modulate = Color(0.15, 0.15, 0.15)
	var selected_hero = hero_controller.selected_hero
	var offset_vector =  + Vector2(0, 6)
	if selected_hero == 0:
		checkmark.position = tobu_icon.position + offset_vector
	if selected_hero == 1:
		checkmark.position = yari_icon.position + offset_vector
	if selected_hero == 2:
		checkmark.position = kinroy_icon.position + offset_vector
	if selected_hero == 3:
		checkmark.position = bakudan_icon.position + offset_vector
