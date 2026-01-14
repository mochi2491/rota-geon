extends Node

@onready var bf: BattleField

@onready var turn_field_left_view = get_node("BattleField/TurnFieldLeft")
@onready var rotation_timer_slot_view = get_node("CanvasLayer/RotationTimerSlot")

# Called when the node enters the scene tree for the first time.
func _ready():
	bf = BattleField.new()

	# 各viewにモデルをセット
	turn_field_left_view.model = bf.fields["Left"]
	turn_field_left_view.init()
	rotation_timer_slot_view.model = bf.fields["Left"]
	rotation_timer_slot_view.init()

## 入力処理
func _input(event):
	if event.is_action_pressed("right"): # 回転時計回り
		bf.fields["Left"]._on_rotate_cw()
	if event.is_action_pressed("left"): # 回転反時計回り
		bf.fields["Left"]._on_rotate_ccw()
	if event.is_action_pressed("ok"): # スキル1使用
		bf.fields["Left"]._use_skill_on_front_character(0, bf)
	if event.is_action_pressed("cancel"): # スキル2使用
		bf.fields["Left"]._use_skill_on_front_character(1, bf)

func _process(delta):
	bf.frame_process(delta)
