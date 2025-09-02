class_name status
extends RefCounted

func _init(data):
	max_hp = data["max_hp"]
	attack = data["attack"]
	armor = data["armor"]
	agility = data["agility"]

var max_hp: int ## 最大HP
var attack: int ## 攻撃力
var armor: int ## 防御力
var agility: int ## 敏捷性 CDを早める
