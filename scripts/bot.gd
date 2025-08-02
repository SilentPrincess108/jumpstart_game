extends Area2D

@export var item_name: String = "Name"
@export var item_desc: String = "This is an item"

func _on_mouse_entered() -> void:
	PopUps.ItemPopUp(item_name, item_desc)

func _on_mouse_exited() -> void:
	PopUps.HideItemPopup()
