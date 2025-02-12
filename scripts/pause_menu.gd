extends CanvasLayer

@onready var resume: TextureButton = $bg/menuHolder/resume
@onready var restart: TextureButton = $bg/menuHolder/restart
@onready var quit: TextureButton = $bg/menuHolder/quit
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var confirm_restart : bool = false

func _ready() -> void:
	visible = false

func _unhandled_input(event):
	if event.is_action_pressed("Restart"):
		if confirm_restart:
			end_game()
			return
		confirm_restart = true
	if event.is_action_pressed("ui_cancel") or event.is_action_pressed("Restart"):
		visible = true
		animation_player.play("pause")
		get_tree().paused = true 
		resume.grab_focus()

func _on_resume_pressed() -> void:
	animation_player.play("resumeGame")
	get_tree().paused = false
	await animation_player.animation_finished
	visible = false
	confirm_restart = false

func _on_restart_pressed() -> void:
	confirm_restart = false
	end_game()

func _on_quit_pressed() -> void:
	get_tree().quit()

func end_game():
	animation_player.play("resumeGame")
	get_tree().paused = false
	visible = false
	get_tree().reload_current_scene()
