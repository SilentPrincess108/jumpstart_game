extends CharacterBody2D

#var to connect to area2d for hover detect
@onready var pop_ups: Control = get_node("/root/PopUps")
@onready var hover_area: Area2D = $HoverArea
@onready var sprite: Sprite2D = $Sprite2D

@onready var ray_cast: RayCast2D = $RayCast2D
@onready var raycast_init = ray_cast.get_target_position()

#vars for item data
@export var item_name: String = "Name"
@export var item_desc: String = "This is an item"
@export var energy: int = 0; #amnt of energy needed to possess object
@export var mass: int = 0 #higher -> slower -> greater illusion of weight
@export var push_force: int = 80;

#var for whether this object is possessed or not
var possessed: bool = false

#var for speed and gravity
const SPEED = 300.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready() -> void:
	hover_area.mouse_entered.connect(_on_mouse_entered)
	hover_area.mouse_exited.connect(_on_mouse_exited)
	
func _physics_process(delta: float) -> void:
	if not is_on_floor(): #fix here
			velocity.y += gravity * delta
	if possessed:
		modulate = Color(0.2, 0, 0)
		get_input(Input, delta)
	else:
		modulate = Color(1, 1, 1)
	if ray_cast.is_colliding() and PossessionManager.selected_object == self:
		var collider = ray_cast.get_collider()
		if collider is CharacterBody2D:
			push_object(collider, delta)
	move_and_slide()
		

func _on_mouse_entered() -> void:
	PopUps.ItemPopUp(item_name, item_desc, self)
	#if Input.is_action_just_pressed("Possess"):
		#PossessionManager.selected_object = self #sets object as possessed

func _on_mouse_exited() -> void:
	PopUps.HideItemPopup()

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

func push_object(target, delta):
	var dir = (target.position - position).normalized()
	target.velocity += dir * push_force * delta
	target.move_and_slide()
