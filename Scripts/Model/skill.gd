class_name Skill
extends RefCounted

## 各スキルの共通パラメータ
var _name: String
var _description: String
var _effect_func: Callable # ステータス、ステート、フィールドへの効果
var _cooldown: float # CD (秒)
var _current_cooldown: float = 0.0
var _current_stock: int
var _max_stock: int
var _pre_cast_time: float # 発動前の時間 (秒)
var _cast_time: float # 発動中の時間 (秒)
var _post_cast_time: float # 発動後の時間 (秒)

func _init(data):
	_name = data["name"]
	_description = data["description"]
	_effect_func = data["effect_func"]
	_cooldown = data["cooldown"]
	_current_stock = data["max_stock"]
	_max_stock = data["max_stock"]
	_pre_cast_time = data["pre_cast_time"]
	_cast_time = data["cast_time"]
	_post_cast_time = data["post_cast_time"]

func _execute(bf: BattleField) -> void:
	if _current_cooldown > 0.0 or _current_stock <= 0:
		return # クールダウン中またはストックなし
	_effect_func.call(bf)
	_current_stock -= 1
	_current_cooldown = _cooldown

func tick_cooldown(delta: float) -> void:
	if _current_cooldown > 0.0:
		_current_cooldown -= delta
		if _current_cooldown < 0.0:
			_current_cooldown = 0.0

func is_ready() -> bool:
	return _current_cooldown <= 0.0 and _current_stock > 0

func reset_stock() -> void:
	_current_stock = _max_stock

func frame_process(delta: float) -> void:
	tick_cooldown(delta)
	return
