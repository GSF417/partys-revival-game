extends HeroEntity

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	SPEED = 225
	jump_height = -450

func die() -> void:
	if dying:
		return
	dying = true
	$CleanupTimer.start()
	$BakudanAbility.execute(lookLeft)

func _on_cleanup_timer_timeout() -> void:
	queue_free()
