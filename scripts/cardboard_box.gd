extends "res://scripts/item.gd"

var open = load("res://assets/sprites/cardboard_box_open.png")
var closed = load("res://assets/sprites/cardboard_box.png")

func _ready() -> void:
	hover_area.mouse_entered.connect(_on_mouse_entered)
	hover_area.mouse_exited.connect(_on_mouse_exited)
	sprite.texture = closed

func get_input(event, delta):
	#Check for movement
	if event.is_action_pressed("left"):
		position.x -= (SPEED * delta) - mass
		sprite.flip_h = true
		ray_cast.target_position = raycast_init * -1
	elif event.is_action_pressed("right"):
		position.x += (SPEED * delta) - mass
		sprite.flip_h = false
		ray_cast.target_position = raycast_init
	if event.is_action_pressed("Open"):
		sprite.texture = open
	
	move_and_slide()
