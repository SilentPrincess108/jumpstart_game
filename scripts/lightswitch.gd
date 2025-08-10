extends "res://scripts/item.gd"

var on = load("res://assets/sprites/lightswitch_on.png")
var off = load("res://assets/sprites/lightswitch_off.png")

@onready var point_light: PointLight2D = $"../../Light/PointLight2D"
@onready var point_light2: PointLight2D = $"../../Light/PointLight2D2"
@onready var directional_light: DirectionalLight2D = $"../../Light/DirectionalLight2D"

func _ready() -> void:
	hover_area.mouse_entered.connect(_on_mouse_entered)
	hover_area.mouse_exited.connect(_on_mouse_exited)
	sprite.texture = off
	directional_light.energy = 0.5
	point_light.enabled = false
	point_light2.enabled = false

func get_input(event, delta):
	#Check for key presses
	if event.is_action_pressed("up"):
		print("Light on")
		sprite.texture = on
		directional_light.energy = 0
		point_light.enabled = true
		point_light2.enabled = true
	elif event.is_action_pressed("down"):
		print("Light off")
		sprite.texture = off
		directional_light.energy = 0.5
		point_light.enabled = false
		point_light2.enabled = false
