extends TextureRect

	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# クールダウンの反映
func OnCooldownChanged(val:int):
	
	pass

# 体力の反映
func OnHpChanged(val:int): 
	if(val < 0):
		return
	$Hpbar.value = val
	pass
