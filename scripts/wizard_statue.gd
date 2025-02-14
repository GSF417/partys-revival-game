extends Sprite2D

@export var target : Node2D
@export var player : Node2D

var activated

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	activated = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func interact(source: Node2D) -> void:
	if source != player:
		return
	if target == null:
		return
	if target.has_method("trigger") && activated == false:
		target.trigger()
		activated = true
