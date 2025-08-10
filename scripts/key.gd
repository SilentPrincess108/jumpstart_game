extends "res://scripts/item.gd"

@onready var cardboard_box: CharacterBody2D = $"../cardboard_box"

var in_door_zone: bool = false
signal door_opened

func _ready() -> void:
	hover_area.mouse_entered.connect(_on_mouse_entered)
	hover_area.mouse_exited.connect(_on_mouse_exited)
	self.visible = false
	

func _physics_process(delta: float) -> void:
	if possessed:
		get_input(Input, delta)
	else:
		if not is_on_floor(): #fix here
			velocity.y += gravity * delta
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
	elif event.is_action_pressed("up"):
		position.y -= (SPEED * delta) - mass
	elif event.is_action_pressed("down"):
		position.y += (SPEED * delta) - mass
	
	if in_door_zone:
		if event.is_action_pressed("key_unlock"):
			print("Door open")
			emit_signal("door_opened")
			GameManager.door_unlocked = true

func _on_door_body_entered(body: Node2D) -> void:
	in_door_zone = true
	print(in_door_zone)

func _on_door_body_exited(body: CharacterBody2D) -> void:
	in_door_zone = false
	print(in_door_zone)

func _on_cardboard_box_spawn_key() -> void:
	position.x = 0
	position.y = 0
	self.visible = true
