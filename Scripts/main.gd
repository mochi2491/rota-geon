extends Node

@onready var bf: BattleField

@onready var turn_field_left_view = get_node("BattleField/TurnFieldLeft")
@onready var player_character_avator_view: Array[CharacterAvatorView] = [
	get_node("BattleField/TurnFieldLeft/CharacterPosition1/Character"),
	get_node("BattleField/TurnFieldLeft/CharacterPosition2/Character"),
	get_node("BattleField/TurnFieldLeft/CharacterPosition3/Character"),
]
@onready var rotation_timer_slot_view = get_node("CanvasLayer/RotationTimerSlot")
@onready var character_panel_view_list = [
	get_node("CanvasLayer/CharacterPanels/CharacterPanel0"),
	get_node("CanvasLayer/CharacterPanels/CharacterPanel1"),
	get_node("CanvasLayer/CharacterPanels/CharacterPanel2"),
]
@onready var enemy_panel_view = get_node("CanvasLayer/EnemyPanel")
@onready var text_window = get_node("CanvasLayer/TextWindow")

# Called when the node enters the scene tree for the first time.
func _ready():
	bf = BattleField.new()
	# 各viewにモデルをセット
	turn_field_left_view.model = bf.fields["Left"]
	turn_field_left_view.init()
	for i in range(3):
		player_character_avator_view[i].model = bf.fields["Left"]._character_array[i]
		player_character_avator_view[i].init()
	rotation_timer_slot_view.model = bf.fields["Left"]
	rotation_timer_slot_view.init()
	for i in range(3):
		character_panel_view_list[i].model = bf.fields["Left"]._character_array[i]
		character_panel_view_list[i].init()

	enemy_panel_view.model = bf.fields["Right"]._character_array[0]
	enemy_panel_view.init()
	return

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
	return
