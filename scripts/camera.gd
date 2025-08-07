extends Camera2D
class_name CustomCamera

@export var TargetNode: Node2D = null
@onready var initial_target = get_node("../player")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	limit_left = 0
	limit_top = 0
	limit_right = 1280
	limit_bottom = 720


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if PossessionManager.selected_object:
		TargetNode = PossessionManager.selected_object
		set_position(TargetNode.get_position())
	else:
		TargetNode = initial_target
		set_position(TargetNode.get_position())
