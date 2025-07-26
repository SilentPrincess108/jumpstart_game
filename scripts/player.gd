extends CharacterBody2D

@export var speed = 400
var target

func _ready():
	target = global_position

func _input(event):
	if event.is_action_pressed("click"):
		target = get_global_mouse_position()

func _physics_process(delta: float) -> void:
	velocity = global_position.direction_to(target) * speed
	if global_position.distance_to(target) > 10:
		move_and_slide()
