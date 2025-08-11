extends CharacterBody2D

@onready var sprite: Sprite2D = $Sprite2D

var neutral_bob = load("res://assets/sprites/person_neutral.png")
var upset_bob = load("res://assets/sprites/person_upset.png")
var scared_bob = load("res://assets/sprites/person_scared.png")

func _ready() -> void:
	sprite.texture = neutral_bob

func _process(delta: float) -> void:
	if GameManager.scare_counter >= 10:
		sprite.texture = scared_bob
		run()
		GameManager.win = true
	elif GameManager.scare_counter >= 3:
		sprite.texture = upset_bob
	elif GameManager.scare_counter >= 2:
		sprite.texture = neutral_bob

func _physics_process(delta: float) -> void:
	if position.x > 1280:
		queue_free()

func run():
	velocity.x = 300
	move_and_slide()
