extends CanvasLayer

@onready var restart: TextureButton = $bg/menuHolder/restart
@onready var resume: TextureButton = $bg/menuHolder/resume
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var confirm_restart : bool = false

func _ready() -> void:
	visible = false

func _unhandled_input(event):
	if event.is_action_pressed("Restart"):
		if confirm_restart:
			end_game()
			return
		visible = true
		animation_player.play("pause")
		get_tree().paused = true 
		restart.grab_focus()
		confirm_restart = true
		
func _on_return_pressed() -> void:
	animation_player.play("resumeGame")
	get_tree().paused = false
	await animation_player.animation_finished
	visible = false
	confirm_restart = false

func _on_restart_pressed() -> void:
	end_game()

func end_game():
	animation_player.play("resumeGame")
	get_tree().paused = false
	visible = false
	get_tree().reload_current_scene()
