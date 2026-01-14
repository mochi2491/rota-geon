extends Control

var max_hp: float = 0
var current_hp: float = 0
var shield: float = 0

var hp_bar_length: float = 0
var shield_bar_length: float = 0

const HEALTH_BAR_LENGTH: float = 250

var hp_bar_node: Control
var shield_bar_node: Control
var under_hp_bar_node: Control

# Called when the node enters the scene tree for the first time.
func _ready():
	hp_bar_node = get_node("HpBar")
	shield_bar_node = get_node("ShieldBar")
	under_hp_bar_node = get_node("UnderHpBar")
	
	max_hp = 1000
	current_hp = max_hp
	shield = 50
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	hp_bar_length = current_hp / max_hp * 250
	shield_bar_length = shield

	if (hp_bar_length + shield_bar_length) > under_hp_bar_node.size.x:
		var ratio = under_hp_bar_node.size.x / (hp_bar_length + shield_bar_length)
		hp_bar_length *= ratio
		shield_bar_length *= ratio
	
	hp_bar_node.size.x = hp_bar_length
	shield_bar_node.size.x = shield_bar_length
	shield_bar_node.position.x = hp_bar_node.size.x
	pass

# shieldBarをHpBarの後ろにくっつけるかつUnderHPBarからはみ出ないようにする
# hp + Shieldが最大HPより多い場合 HPBarとShieldBarを縮めてUnderHPBarからはみ出ないようにする
