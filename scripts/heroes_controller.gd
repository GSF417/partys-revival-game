extends Node2D
class_name HeroesHandler

@export var players : Array[HeroEntity] = [null, null, null, null]
@export var camera : Camera2D

var selected_hero 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	selected_hero = 0

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
	players[selected_hero].remove_child(camera)
	selected_hero = switch_to
	if (players[selected_hero] == null):
		selected_hero = find_living_hero()
		if (selected_hero == -1):
			end_game()
			return
	players[selected_hero].add_child(camera)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if players[selected_hero] != null:
		players[selected_hero].checkForActions()
	if Input.is_action_pressed("SwitchFirst"):
		switch_hero(0)
	if Input.is_action_pressed("SwitchSecond"):
		switch_hero(1)
	if Input.is_action_pressed("SwitchThird"):
		switch_hero(2)
	if Input.is_action_pressed("SwitchFourth"):
		switch_hero(3)

func end_game():
	pass
