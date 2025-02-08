extends StaticBody2D

@onready var detection_range = $DetectionRange
@onready var timer = $Timer

var attacking : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if detection_range == null:
		return
	if detection_range.heroes_count() > 0:
		attacking = true
		timer.start()

func _on_timer_timeout() -> void:
	attacking = false
