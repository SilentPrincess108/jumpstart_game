extends Control

@onready var item: Label = %Name
@onready var info: Label = %Desc
var current_target = null #to track hovered object
signal item_possessed

func ItemPopUp(item_name, desc, target):
	var mouse_pos = get_viewport().get_mouse_position()
	item.text = item_name
	info.text = desc
	current_target = target
	%ItemPopUp.popup(Rect2i(mouse_pos, %ItemPopUp.size))

func HideItemPopup():
	%ItemPopUp.hide()
	current_target = null

func _process(_delta: float) -> void:
	if current_target and Input.is_action_just_pressed("Possess"):
		print("Item possessed")
		item_possessed.emit()
		HideItemPopup()
