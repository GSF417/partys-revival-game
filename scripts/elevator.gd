extends RigidBody2D

@export var distance: int

var step = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.freeze = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func trigger() -> void:
	if step == 0:
		move_up()
	if step == 2:
		self.freeze = false

func change_step():
	step = 2

func move_up():
	var tween = create_tween()
	tween.tween_property(self, "position", position + Vector2(0, -distance), 3)
	step = 1
	tween.tween_callback(change_step)
