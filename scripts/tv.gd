extends "res://scripts/item.gd"

var on = load("res://assets/sprites/TV_on.png")
var off = load("res://assets/sprites/TV_off.png")

@onready var point_light: PointLight2D = $"../../PointLight2D"

func _ready() -> void:
	hover_area.mouse_entered.connect(_on_mouse_entered)
	hover_area.mouse_exited.connect(_on_mouse_exited)
	sprite.texture = off
	point_light.enabled = false

func _physics_process(delta: float) -> void:
	if possessed:
		get_input(Input, delta)

func get_input(event, delta):
	#Check for key presses
	if event.is_action_pressed("up"):
		sprite.texture = on
		point_light.enabled = true
	elif event.is_action_pressed("down"):
		sprite.texture = off
		point_light.enabled = false
