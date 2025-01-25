extends Node2D

func trigger():
	get_parent().queue_free()
