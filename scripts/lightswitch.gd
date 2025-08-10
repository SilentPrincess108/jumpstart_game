extends "res://scripts/item.gd"

var on = load("res://assets/sprites/lightswitch_on.png")
var off = load("res://assets/sprites/lightswitch_off.png")

func get_input(event, delta):
	#Check for key presses
	if event.is_action_pressed("up"):
		sprite.texture = on
		print("Light on")
	elif event.is_action_pressed("down"):
		sprite.texture = off
		print("Light off")
