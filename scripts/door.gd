extends Area2D

@onready var pop_ups: Control = get_node("/root/PopUps")
@onready var hover_area: Area2D = $HoverArea
@onready var sprite: Sprite2D = $Sprite2D

@export var item_name: String = "Name"
@export var item_desc: String = "This is an item"
@export var energy: int = 0 #amnt of energy needed to possess object

var closed = load("res://assets/sprites/door.png")
var open = load("res://assets/sprites/door_open.png")

func _ready() -> void:
	hover_area.mouse_entered.connect(_on_mouse_entered)
	hover_area.mouse_exited.connect(_on_mouse_exited)
	sprite.texture = closed
	item_desc = "A door leading out the room. It's locked."

func _on_mouse_entered() -> void:
	PopUps.ItemPopUp(item_name, energy, item_desc, self)

func _on_mouse_exited() -> void:
	PopUps.HideItemPopup()

func _on_key_door_opened() -> void:
	sprite.texture = open
	item_desc = "Unlocked door."
