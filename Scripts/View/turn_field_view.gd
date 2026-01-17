extends Sprite3D

## 現在の正面のキャラクターのナンバー
var _current_front_num = 0

## 現在回転中かどうか
var _is_rotating: bool

@onready var model: TurnField

## turn filed を回転させる
## @param next_front_num 正面のキャラクターのnumber
func _rotate_field(next_front_num: int) -> void:
	# すでに回転中の場合は何もしない
	if _is_rotating:
		return
	_is_rotating = true

	if next_front_num < 0 || next_front_num > 2:
		printerr("想定外のキャラクターが先頭に選択されました : next_front_num = ", next_front_num)
		return
	
	# 移動方向の計算
	if next_front_num == _current_front_num:
		printerr("現在の正面のキャラクターと同じキャラクターが選択されました", next_front_num)
		return

	var direction = 1
	if next_front_num - _current_front_num == 1 or next_front_num - _current_front_num == -2:
		direction = -1

	_current_front_num = next_front_num

	# アニメーション
	var _tween = get_tree().create_tween()
	var duration: float = 0.4
	_tween.tween_property(self, "rotation_degrees", Vector3(-80, 0, rotation_degrees.z + 120 * direction), duration)
	_tween.tween_callback(_on_finish_rotate)
	return

func _on_finish_rotate():
	_is_rotating = false

func init():
	model.change_character_number.connect(_rotate_field)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
