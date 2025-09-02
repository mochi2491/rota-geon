extends Control

var max_cd: float = 0.0
var current_cd: float = 0.0
var can_reduce_cd: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_reduceCd()
	_updateView()
	pass

func _updateView() -> void:
	$SkillIconShadow.scale.y = current_cd / max_cd

## current_cdを減らしていく
func _reduceCd() -> void:
	if can_reduce_cd && current_cd > 0:
		current_cd -= get_process_delta_time()
	elif current_cd < 0:
		current_cd = 0
	return
func on_changed_cd(changedCd: float) -> void:
	if changedCd < 0:
		printerr("不正な値です")
		return
	current_cd = changedCd
	return

func on_start_cd() -> void:
	current_cd = max_cd
	return
