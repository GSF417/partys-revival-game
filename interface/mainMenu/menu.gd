extends Control
class_name mainMenu

func _ready()-> void:
	for _button in get_tree().get_nodes_in_group("button"):
		_button.pressed.connect(_on_button_pressed.bind(_button))
		
func _on_button_pressed(_button: Button)-> void:
	match _button.name:
		"newGame":
			get_tree().change_scene_to_file("res://levels/level1.tscn")
		"controls":
			get_tree().change_scene_to_file("res://interface/mainMenu/controles.tscn")
		"exit":
			get_tree().quit()
	
