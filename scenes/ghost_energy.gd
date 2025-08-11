extends Control

@onready var energy: Label = $energy

func _process(delta: float) -> void:
	energy.text = "Possession Energy: " + str(GameManager.ghost_power)
