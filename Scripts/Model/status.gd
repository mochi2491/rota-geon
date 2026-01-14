class_name Status
extends RefCounted

# 入力はJson?
func _init(data):
	_origin_max_hp = data["max_hp"]
	_current_hp = data["max_hp"]
	_shield_stack = []
	_max_hp = data["max_hp"]
	_attack = data["attack"]
	_armor = data["armor"]
	_agility = data["agility"]

var _origin_max_hp: float ## 元の最大HP
var _max_hp: float ## 最大HP
var _current_hp: float ## 現在のHP
var _shield_stack: Array[Shield] ## シールドのスタック
var _attack: float ## 攻撃力
var _armor: float ## 防御力
var _agility: float ## 敏捷性 CDを早める


func _get_total_shield() -> float:
	# シールドの合計値を取得
	return 0

func _take_damage(damage: float) -> float:
	return 0


func frame_process(delta: float) -> void:
	return
