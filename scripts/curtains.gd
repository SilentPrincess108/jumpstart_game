extends "res://scripts/item.gd"

var on = load("res://assets/sprites/lightswitch_on.png")
var off = load("res://assets/sprites/lightswitch_off.png")

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	hover_area.mouse_entered.connect(_on_mouse_entered)
	hover_area.mouse_exited.connect(_on_mouse_exited)
	animated_sprite.play("idle")

func _physics_process(delta: float) -> void:
	if possessed:
		get_input(Input, delta)

func get_input(event, delta):
	#Check for key presses
	if event.is_action_pressed("left"):
		animated_sprite.play("open")
	elif event.is_action_pressed("right"):
		animated_sprite.play("close")
