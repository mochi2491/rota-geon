class_name Character
extends RefCounted

var _status: Status
var _active_skill_slot: Array[Skill] = []
var _passive_skill_slot: Array[String] = []
# Todo
# HPの処理をStatusに以上する

func _use_active_skill(skill_num: int, bf: BattleField) -> void:
	_active_skill_slot[skill_num]._execute(bf)
	return

func _init(max_hp: int, skill_data_1, skill_data_2) -> void:
	var data = {
		"max_hp": max_hp,
		"attack": 10,
		"armor": 5,
		"agility": 3
	}
	_status = Status.new(data)
	_active_skill_slot.append(Skill.new(skill_data_1))
	_active_skill_slot.append(Skill.new(skill_data_2))
	return

func frame_process(delta: float) -> void:
	_status.frame_process(delta)
	for skill in _active_skill_slot:
		skill.frame_process(delta)
	return