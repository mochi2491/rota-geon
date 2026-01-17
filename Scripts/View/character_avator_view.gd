class_name CharacterAvatorView
extends Sprite3D

var animation_player: AnimationPlayer
var model: Character

# Called when the node enters the scene tree for the first time.
func _ready():
	animation_player = get_node("AnimationPlayer")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#TurnFieldと一緒に動くための処理
	position = get_parent().global_position
	pass

func init() -> void:
	model._active_skill_slot[0].skill_fired.connect(play_animation)
	return

func play_animation(anim_name: String) -> void:
	if animation_player.has_animation(anim_name):
		animation_player.play(anim_name)
	else:
		printerr("アニメーションが見つかりません: ", anim_name)
	return
