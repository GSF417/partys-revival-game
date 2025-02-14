extends Sprite2D

@onready var light = $PointLight2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	light.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func trigger() -> void:
	light.visible = true
