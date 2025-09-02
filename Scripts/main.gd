extends Node

@onready var bf: battle_field

@onready var turn_field_left_view = get_node("BattleField/TurnFieldLeft")
@onready var rotation_timer_slot_view = get_node("CanvasLayer/RotationTimerSlot")

# Called when the node enters the scene tree for the first time.
func _ready():
	bf = battle_field.new()

	# 各viewにモデルをセット
	turn_field_left_view.model = bf.fields["Left"]
	turn_field_left_view.init()
	rotation_timer_slot_view.model = bf.fields["Left"]
	rotation_timer_slot_view.init()

func _input(event):
	if event.is_action_pressed("right"):
		bf.fields["Left"].on_rotate_cw()
	if event.is_action_pressed("left"):
		bf.fields["Left"].on_rotate_ccw()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	bf.frame_process(delta)
