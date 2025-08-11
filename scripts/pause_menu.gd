extends Control

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	self.hide()
	animation_player.play("RESET")
	

func resume():
	get_tree().paused = false
	animation_player.play_backwards("blur")
	self.hide()

func pause():
	self.show()
	get_tree().paused = true
	animation_player.play("blur")
	
func testEsc():
	if Input.is_action_just_pressed("esc") and get_tree().paused == false:
		pause()
	elif Input.is_action_just_pressed("esc") and get_tree().paused == true:
		resume()


func _on_resume_pressed() -> void:
	resume()


func _on_restart_pressed() -> void:
	resume()
	get_tree().reload_current_scene()
	GameManager.reload()


func _on_quit_pressed() -> void:
	get_tree().quit()

func _process(delta: float) -> void:
	testEsc()
