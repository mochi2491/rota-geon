class_name SkillIconView
extends Control

@onready var model: Skill

@onready var skill_icon_texture: TextureRect
@onready var skill_icon_shadow: TextureRect
@onready var skill_icon_frame: TextureRect

var max_cd: float = 0.0
var current_cd: float = 0.0
var can_reduce_cd: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	skill_icon_texture = get_node("SkillIconTexture")
	skill_icon_shadow = get_node("SkillIconShadow")
	skill_icon_frame = get_node("SkillIconFrame")
	return

func init():
	model.cooldown_changed.connect(on_changed_cd)
	return


func on_changed_cd(changedCd: float) -> void:
	if changedCd < 0:
		printerr("不正な値です")
		return
	current_cd = changedCd
	skill_icon_shadow.scale.y = current_cd
	return
