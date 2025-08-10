extends "res://scripts/item.gd"

var open = load("res://assets/sprites/cardboard_box_open.png")
var closed = load("res://assets/sprites/cardboard_box.png")

signal spawn_key
var key_spawned: bool = false

func _ready() -> void:
	hover_area.mouse_entered.connect(_on_mouse_entered)
	hover_area.mouse_exited.connect(_on_mouse_exited)
	sprite.texture = closed

func _physics_process(delta: float) -> void:
	if not is_on_floor(): #fix here
		velocity.y += gravity * delta
	if possessed:
		get_input(Input, delta)
	if ray_cast.is_colliding() and PossessionManager.selected_object == self:
		var collider = ray_cast.get_collider()
		if collider is CharacterBody2D:
			push_object(collider, delta)
	if self.position.y > 100:
		if key_spawned != true:
			sprite.texture = open
			emit_signal("spawn_key")
			key_spawned = true
	
	move_and_slide()

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
	
	move_and_slide()
