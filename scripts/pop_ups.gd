extends Control

func ItemPopUp(object, item):
	var mouse_pos = get_viewport().get_mouse_position()
	%ItemPopUp.popup(Rect2i(mouse_pos, %ItemPopUp.size))

func HideItemPopup():
	%ItemPopUp.hide()
