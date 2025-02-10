extends CanvasLayer

@onready var resume: TextureButton = $bg/menuHolder/resume
@onready var quit: TextureButton = $bg/menuHolder/quit
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	visible = false

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		visible = true
		animation_player.play("pause")
		get_tree().paused = true 
		resume.grab_focus()

func _on_resume_pressed() -> void:
	animation_player.play("resumeGame")
	get_tree().paused = false
	await animation_player.animation_finished
	visible = false

func _on_quit_pressed() -> void:
	get_tree().quit()
