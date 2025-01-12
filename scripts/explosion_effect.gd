extends Area2D
class_name ExplosionEffect

const explosion_scene: PackedScene = preload("res://scenes/explosion_effect.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play()

static func createExplosion(pos: Vector2) -> ExplosionEffect:
	var explosion: ExplosionEffect = explosion_scene.instantiate()
	explosion.global_position = pos
	return explosion

func _on_timer_timeout() -> void:
	queue_free()
