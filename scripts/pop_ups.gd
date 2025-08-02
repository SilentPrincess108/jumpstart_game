extends Control

@onready var item: Label = %Name
@onready var info: Label = %Desc


func ItemPopUp(item_name, desc):
	var mouse_pos = get_viewport().get_mouse_position()
	item.text = item_name
	info.text = desc
	%ItemPopUp.popup(Rect2i(mouse_pos, %ItemPopUp.size))

func HideItemPopup():
	%ItemPopUp.hide()
