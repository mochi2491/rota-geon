class_name turn_field
extends RefCounted

## _front_character_number
## 現在の正面のキャラクターのナンバー
## 0~2の値を持つ
var _front_character_number: int = 0
var _character_array = []

## _rotate_duration
## 回転アニメーションのCD
## 秒数で指定
const _rotate_cooldown: float = 0.4
var _current_rotate_cooldown: float = 0.0
var _current_stock_cooldown_list: Array[float] = [0.0, 0.0, 0.0]
var _can_use_stock_list: Array[bool] = [true, true, false]

## 回転ストックの最大個数
const _max_rotate_stock: int = 3

## 回転ストックのクールダウン時間の基礎時間
const _origin_stock_cooldown: float = 4.0

signal change_character_number(number: int)
signal change_rotate_stock(valid_stock_list: Array[bool], cooldown_ratio_list: Array[float])

func _init():
	_character_array.append(character.new(50))
	_character_array.append(character.new(50))
	_character_array.append(character.new(50))
	return

func get_can_use_rotate_stock_num() -> int:
	# CDを解消しているストックの番号を取得
	for i in range(_max_rotate_stock):
		if _can_use_stock_list[i] and _current_stock_cooldown_list[i] <= 0:
			_current_stock_cooldown_list[i] = _rotate_cooldown
			return i
	return -1

func on_rotate_cw() -> void:
	var focused_stock_num = get_can_use_rotate_stock_num()

	# 使用可能なストックがない場合は何もしない
	if focused_stock_num == -1:
		return

	# 回転アニメーションのクールダウン時間が残っている場合は何もしない
	if _current_rotate_cooldown > 0:
		return

	# 最前のキャラクターの変更処理
	if _front_character_number == 2:
		_front_character_number = 0
		change_character_number.emit(_front_character_number)
	else:
		_front_character_number += 1
		change_character_number.emit(_front_character_number)

	_current_stock_cooldown_list[focused_stock_num] = _origin_stock_cooldown

	print(_front_character_number)
	return
	
func on_rotate_ccw() -> void:
	var focused_stock_num = get_can_use_rotate_stock_num()

	# 使用可能なストックがない場合は何もしない
	if focused_stock_num == -1:
		return

	# 回転アニメーションのクールダウン時間が残っている場合は何もしない
	if _current_rotate_cooldown > 0:
		return

	# 最前のキャラクターの変更処理
	if _front_character_number == 0:
		_front_character_number = 2
		change_character_number.emit(_front_character_number)
	else:
		_front_character_number -= 1
		change_character_number.emit(_front_character_number)

	_current_stock_cooldown_list[focused_stock_num] = _origin_stock_cooldown
	print(_front_character_number)
	return

func _consume_cooldown(delta: float) -> void:
	var cd_list: Array[float] = [0.0, 0.0, 0.0]

	# 回転ストックのクールダウン時間を消費
	for i in range(_max_rotate_stock):
		if _current_stock_cooldown_list[i] > 0:
			_current_stock_cooldown_list[i] -= delta
			cd_list[i] = _current_stock_cooldown_list[i] / _origin_stock_cooldown

	# 回転アニメーションのクールダウン時間を消費
	if _current_rotate_cooldown > 0:
		_current_rotate_cooldown -= delta
	else:
		_current_rotate_cooldown = 0

	# 回転ストックの情報をViewに送信
	change_rotate_stock.emit(_can_use_stock_list, cd_list)
	return

## 毎フレーム呼ばれる
func frame_process(delta: float):
	_consume_cooldown(delta)