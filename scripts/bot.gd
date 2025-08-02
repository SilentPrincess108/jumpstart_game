extends Area2D

func _on_mouse_entered() -> void:
	PopUps.ItemPopUp(null, null)

func _on_mouse_exited() -> void:
	PopUps.HideItemPopup()
