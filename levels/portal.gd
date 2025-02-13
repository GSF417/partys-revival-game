extends Sprite2D

@onready var move = $AnimationPlayer
@export var kill : RigidBody2D
@export var clap : AudioStreamPlayer2D

var correct_sequence = [1, 2, 3, 4]
var entered_sequence = []
var count = 0
var correct = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func trigger(ord : int) -> void:
	entered_sequence.append(ord)
	if count == 0:
		clap.play()
	count += 1
	print("interagiu com o portal", count, " ", entered_sequence[count-1])
	if entered_sequence[ord-1] == ord:
		correct += 1
		clap.volume_db += 4
	if count == 4:
		if correct == 4:
			print("portal ativado")
			self.visible = true
			move.play("portal")
		else:
			kill.freeze = false
			print("sequencia errada")
