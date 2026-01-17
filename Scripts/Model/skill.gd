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
var _animation: String # アニメーションリソースパス

## スキル詠唱待ち
var _is_casting: bool = false
var _casting_timer: float = 0.0

signal cooldown_changed(cooldown_ratio: float)
signal skill_fired(animation: String)

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
	_animation = data["animation"]
	return

func _execute(bf: BattleField) -> void:
	if _current_cooldown > 0.0 or _current_stock <= 0:
		return # クールダウン中またはストックなし
	await await_time(2.0)
	_effect_func.call(bf)
	_current_stock -= 1
	_current_cooldown = _cooldown
	cooldown_changed.emit(_current_cooldown / _cooldown)

func tick_cooldown(delta: float) -> void:
	if _current_cooldown > 0.0 && _current_stock < _max_stock:
		_current_cooldown -= delta
		if _current_cooldown < 0.0:
			_current_cooldown = 0.0
			_current_stock += 1
	cooldown_changed.emit(_current_cooldown / _cooldown)
	return

func await_time(time: float) -> Signal:
	_is_casting = true
	_casting_timer = time
	return self.skill_fired

func frame_process(delta: float) -> void:
	tick_cooldown(delta)

	if _is_casting:
		_casting_timer -= delta
		if _casting_timer <= 0.0:
			_is_casting = false
			_casting_timer = 0.0
			skill_fired.emit(_animation)
	return
