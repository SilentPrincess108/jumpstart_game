extends CharacterBody2D

var possessed: bool = false


func _on_mouse_entered() -> void:
	PopUps.ItemPopUp(item_name, item_desc, self)
	#if Input.is_action_just_pressed("Possess"):
		#PossessionManager.selected_object = self #sets object as possessed

func _on_mouse_exited() -> void:
	PopUps.HideItemPopup()
