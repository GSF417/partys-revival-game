extends Sprite2D

@onready var move = $AnimationPlayer
@export var kill : RigidBody2D
@export var clap : AudioStreamPlayer2D
@export var music : AudioStreamPlayer2D
@export var light : Node2D

var correct_sequence = [1, 2, 3, 4]
var entered_sequence = []
var count = 0
var correct = 0
var inc = 0
var countInc = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if self.visible == true:
		countInc += 1
		if countInc > 15:
			countInc = 0
			inc += 1
			light.texture_scale = light.texture_scale - ((light.texture_scale*cos(inc%17))/30)
			light.energy = light.energy - ((light.energy*cos(inc%17))/20)


func trigger(ord : int) -> void:
	entered_sequence.append(ord)
	if count == 0:
		clap.play()
	count += 1
	print("interagiu com o portal", count, " ", entered_sequence[count-1])
	if entered_sequence[count-1] == correct_sequence[count-1]:
		correct += 1
		clap.volume_db += 4
		music.volume_db += 1
		clap.pitch_scale += 0.15
	if count == 4:
		if correct == 4:
			print("portal ativado")
			self.visible = true
			move.play("portal")
		else:
			kill.freeze = false
			print("sequencia errada")
