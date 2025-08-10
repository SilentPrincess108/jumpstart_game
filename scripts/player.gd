extends CharacterBody2D

const SPEED = 400.0
const JUMP_VELOCITY = -400.0

@onready var player = $Sprite2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var possessing = false

func _ready() -> void:
	position = Vector2(0, 180)
	#var receiver = get_node("/root/PopUps")
	#receiver.connect("item_possessed", is_possessing)

func _physics_process(delta: float) -> void:
	is_possessing()
	#if not is_on_floor():
		#velocity.y += gravity * delta
	if not possessing:
		get_input(Input, delta)

func is_possessing():
	if PossessionManager.selected_object:
		possessing = true
	else:
		possessing = false

func get_input(event, delta):
	#Check for movement
	if event.is_action_pressed("left"):
		position.x -= SPEED * delta
		player.flip_h = true
	elif event.is_action_pressed("right"):
		position.x += SPEED * delta
		player.flip_h = false
	move_and_slide()
