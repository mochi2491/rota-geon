class_name battle_field
extends RefCounted
## 責務
## TurnFieldクラスの保持
## 戦闘の状態やTurnField同士のやり取り

var fields = {}

func _init():
	fields = {"Left": turn_field.new()}

func _input(event):
	# 入力イベントをTurnFieldに伝える
	if event.is_action_pressed("right"):
		fields["left"].on_rotate_cw()
	if event.is_action_pressed("left"):
		fields["left"].on_rotate_ccw()

func frame_process(delta: float):
	for field in fields:
		fields[field].frame_process(delta)
