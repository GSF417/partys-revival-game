extends Area2D

@export var warp_to : String

func _on_area_entered(area: Area2D) -> void:
	if area.get_parent() is HeroEntity:
		get_tree().change_scene_to_file(warp_to)
