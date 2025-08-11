extends Control

@onready var item: Label = %Name
@onready var info: Label = %Desc
@onready var Energy: Label = %Energy

var current_target = null #to track hovered object
#signal item_possessed

func ItemPopUp(item_name, energy, desc, target):
	var mouse_pos = get_viewport().get_mouse_position()
	item.text = item_name
	Energy.text = "Req. energy: " + str(energy)
	info.text = desc
	current_target = target
	%ItemPopUp.popup(Rect2i(mouse_pos, %ItemPopUp.size))

func HideItemPopup():
	%ItemPopUp.hide()
	current_target = null

func _process(_delta: float) -> void:
	if current_target and Input.is_action_just_pressed("Possess"):
		if GameManager.ghost_power >= current_target.energy:
			if PossessionManager.selected_object == null:
				print("Item possessed")
				current_target.possessed = true
				PossessionManager.selected_object = current_target
				GameManager.ghost_power -= current_target.energy
				GameManager.scare_counter += current_target.scare_val
				print(GameManager.ghost_power)
		else:
			print("Not enough energy!")
	elif current_target == PossessionManager.selected_object and Input.is_action_just_pressed("De-possess"):
		current_target.possessed = false
		PossessionManager.selected_object = null
