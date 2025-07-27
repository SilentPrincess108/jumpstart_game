extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func get_input():
	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if Input.is_action_pressed("click"):
		print("Clicked!")

func _physics_process(delta: float) -> void:
	get_input()
	move_and_slide()
