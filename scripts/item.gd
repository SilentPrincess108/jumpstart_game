extends CharacterBody2D

#var to connect to area2d for hover detect
@onready var pop_ups: Control = get_node("/root/PopUps")
@onready var hover_area: Area2D = $HoverArea

#vars for item data
@export var item_name: String = "Name"
@export var item_desc: String = "This is an item"

#var for whether this object is possessed or not
var is_possessed: bool = false

#var for speed and gravity
const SPEED = 300.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready() -> void:
	hover_area.mouse_entered.connect(_on_mouse_entered)
	hover_area.mouse_exited.connect(_on_mouse_exited)
	
func _physics_process(delta: float) -> void:
	if is_possessed:
		if not is_on_floor():
			velocity.y += gravity * delta
		get_input(Input, delta)

func _on_mouse_entered() -> void:
	PopUps.ItemPopUp(item_name, item_desc, self)

func _on_mouse_exited() -> void:
	PopUps.HideItemPopup()

func get_input(event, delta):
	#Check for movement
	if event.is_action_pressed("left"):
		position.x -= SPEED * delta
	elif event.is_action_pressed("right"):
		position.x += SPEED * delta
	move_and_slide()
