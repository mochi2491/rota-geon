class_name CharacterPanelView
extends Control

@onready var model: Character

var health_bar_view: HealthBarView
var skill_icon_view_slot: Array[SkillIconView] = []
var state_slot_view: StateSlotView

# Called when the node enters the scene tree for the first time.
func _ready():
	health_bar_view = get_node("Panel/HealthBar")
	skill_icon_view_slot.append(get_node("Panel/SkillIcon1"))
	skill_icon_view_slot.append(get_node("Panel/SkillIcon2"))
	state_slot_view = get_node("Panel/StateSlot")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func init():
	for i in range(2):
		skill_icon_view_slot[i].model = model._active_skill_slot[i]
		skill_icon_view_slot[i].init()
	model._status.change_current_hp.connect(OnHpChanged)

	state_slot_view.model = model._state_slot
	state_slot_view.init()
	pass

# 体力の反映
func OnHpChanged(val: float):
	health_bar_view.current_hp = val
	pass
