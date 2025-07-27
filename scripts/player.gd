extends CharacterBody2D

@export var speed = 400

var click_position = Vector2()
var target_position = Vector2()

func _input(event):
	if event.is_action_pressed("click"):
		click_position = get_global_mouse_position()

func _physics_process(delta: float) -> void:
	if position.distance_to(click_position) > 3:
		target_position = (click_position - position).normalized()
		velocity = target_position * speed
		move_and_slide()
		
