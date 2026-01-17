extends Control

var timer_list: Array = []

const MAX_TIMER_COUNT = 3

@onready var model: TurnField

func _set_cooldown(scale: float, num: int) -> void:
	timer_list[num].get_node("Shadow").scale.x = scale
	timer_list[num].get_node("Shadow").scale.y = scale
	return

func _set_visible(visible: bool, num: int) -> void:
	timer_list[num].visible = visible
	return

func _set_rotation_timer_slot(valid_list: Array[bool], scale_list: Array[float]) -> void:
	for i in range(MAX_TIMER_COUNT):
		_set_visible(valid_list[i], i)
		_set_cooldown(scale_list[i], i)
	return

func init():
	model.change_rotate_stock.connect(_set_rotation_timer_slot)
	return

# Called when the node enters the scene tree for the first time.
func _ready():
	timer_list = get_children()
	pass # Replace with function body.
