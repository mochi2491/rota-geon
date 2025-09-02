class_name character
extends RefCounted

var _current_hp: int:
	get:
		return _current_hp
		
var _max_hp: int:
	get:
		return _max_hp
		
var _shield: int:
	get:
		return _shield

func _init(max_hp: int):
	_max_hp = max_hp
	_current_hp = _max_hp
	_shield = 0
