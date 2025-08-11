extends Control

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	self.hide()
	animation_player.play("RESET")


func _process(delta: float) -> void:
	if GameManager.win:
		self.show()
		animation_player.play("blur")

func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
