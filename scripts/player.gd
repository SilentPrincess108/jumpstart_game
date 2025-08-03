extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready() -> void:
	position = Vector2(600, 300)

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta
	get_input(Input, delta)

func get_input(event, delta):
	#Check for movement
	if event.is_action_pressed("left"):
		position.x -= SPEED * delta
	elif event.is_action_pressed("right"):
		position.x += SPEED * delta
	move_and_slide()
