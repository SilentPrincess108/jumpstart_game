extends Node

var current_possessed: CharacterBody2D = null

func possess(target):
	if current_possessed:
		current_possessed.is_possessed = false
	
	current_possessed = target
	current_possessed.is_possessed = true
