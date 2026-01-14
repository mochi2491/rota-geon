class_name BattleField
extends RefCounted

## 責務
## TurnFieldクラスの保持
## 戦闘の状態やTurnField同士のやり取り

var fields = {}
var skill_dict = SkillDict.new()

func _init():
	fields = {"Left": TurnField.new(), "Right": TurnField.new()}
	fields["Left"]._add_character(Character.new(60, skill_dict._skill_dictionary["sample1"], skill_dict._skill_dictionary["sample1"]))
	fields["Left"]._add_character(Character.new(60, skill_dict._skill_dictionary["sample1"], skill_dict._skill_dictionary["sample1"]))
	fields["Left"]._add_character(Character.new(60, skill_dict._skill_dictionary["sample1"], skill_dict._skill_dictionary["sample1"]))
	fields["Right"]._add_character(Character.new(200, skill_dict._skill_dictionary["sample1"], skill_dict._skill_dictionary["sample1"]))

func frame_process(delta: float):
	for field in fields:
		fields[field].frame_process(delta)
