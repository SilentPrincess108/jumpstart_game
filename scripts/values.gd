extends Control

@onready var energy: Label = $VBoxContainer/energy
@onready var scare_counter: Label = $VBoxContainer/scare_counter

func _process(delta: float) -> void:
	energy.text = "Possession Energy: " + str(GameManager.ghost_power)
	scare_counter.text = "Scare counter: " + str(GameManager.scare_counter)
