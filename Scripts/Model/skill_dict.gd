class_name SkillDict
extends RefCounted
var _skill_dictionary: Dictionary = {
	"sample1": {
		"name": "sample1",
		"description": "Launches a fiery projectile that deals damage to a single target.",
		"effect_func": func(bf: BattleField) -> void:
			print("Fireball effect executed")
			# ダメージ処理のロジックをここに実装
			
			bf.fields["Right"]._character_array[0]._status._take_damage(30.0)
			return ,
		"cooldown": 5.0,
		"max_stock": 1,
		"pre_cast_time": 0.5,
		"cast_time": 0.2,
		"post_cast_time": 0.3,
		"animation": "player_moves/attack_1",
	},
}
