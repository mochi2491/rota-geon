class_name SkillDict
extends RefCounted
var _state_dictionary: StateDict = StateDict.new()
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
	"sample2": {
		"name": "sample2",
		"description": "Attach Poison State",
		"effect_func": func(bf: BattleField) -> void:
			print("Poisoned.")
			bf.fields["Right"]._character_array[0]._state_slot._add_state(State.new(
				{
					"name": _state_dictionary._state_dict["poison"]["name"],
					"stackable": _state_dictionary._state_dict["poison"]["stackable"],
					"is_permanent": _state_dictionary._state_dict["poison"]["is_permanent"],
					"max_stack": _state_dictionary._state_dict["poison"]["max_stack"],
					"state_sprite": _state_dictionary._state_dict["poison"]["state_sprite"],
					"max_duration": 5.0,
					"duration": 5.0,
					"source": 0,
					"stack": 1
				}
			))
			return ,
		"cooldown": 8.0,
		"max_stock": 1,
		"pre_cast_time": 0.3,
		"cast_time": 0.4,
		"post_cast_time": 0.2,
		"animation": "player_moves/attack_1",
	},
}
