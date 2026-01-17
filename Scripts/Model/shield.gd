class_name Shield
extends RefCounted

## シールドクラス
## - シールドの値、減少値、継続時間を管理する

# シールドの値
var _value: float
# シールド1fごとの減少値
var _decay_per_frame: float
# シールドの継続時間
var _duration: float

func _init(value: float, decay_per_frame: float, duration: float):
	self._value = value
	self._decay_per_frame = decay_per_frame
	self._duration = duration
	return

func _reduce(delta: float) -> void:
	# シールドの減少処理
	_value -= _decay_per_frame * delta
	_duration -= delta
	if _value < 0:
		_value = 0
	if _duration < 0:
		_duration = 0
	return
