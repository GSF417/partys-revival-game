extends Node2D
class_name YariSlash

const slash_scene: PackedScene = preload("res://scenes/heroes/abilities/yari_slash_instance.tscn")
var flipLeft
@onready var sprite := $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	if sprite != null:
		sprite.flip_h = flipLeft

func _process(delta: float):
	sprite.play()
	if sprite != null:
		sprite.flip_h = flipLeft

static func createSlash(lookLeft: bool) -> YariSlash:
	var yari_slash: YariSlash = slash_scene.instantiate()
	yari_slash.flipLeft = lookLeft
	return yari_slash

func _on_timer_timeout():
	queue_free()
