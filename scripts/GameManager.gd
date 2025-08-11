extends Node

var door_unlocked: bool = false

var ghost_power: int = 6
var init_power = ghost_power
var scare_counter: int = 0

const FILE_BEGIN = "res://scenes/Levels/level_"

var win: bool = false

func _process(delta: float) -> void:
	if win:
		print("You won!")

func next_level():
	var current_scene_file = get_tree().current_scene.scene_file_path
	var next_level_number = current_scene_file.to_int() + 1
	
	var next_level_path = FILE_BEGIN + str(next_level_number) + ".tscn"
	get_tree().change_scene_to_file(next_level_path)
	
	ghost_power = init_power + 1
	scare_counter = 0

func reload():
	ghost_power = init_power
	scare_counter = 0

	
