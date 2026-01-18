class_name State
extends RefCounted

# 名前
# 継続時間
# スタック
# 誰から付与されたか

## Constants
var k_name: String
var k_max_stack: int
var k_stackable: bool
var k_is_permanent: bool = false
var k_source: int
var k_max_duration: float
var k_state_sprite: String

## Variables
var duration: float
var stack: int

signal state_expired(state: State)

func _init(data):
    k_name = data["name"]
    k_is_permanent = data["is_permanent"]
    k_max_stack = data["max_stack"]
    k_stackable = data["stackable"]
    k_source = data["source"]
    k_max_duration = data["max_duration"]
    k_state_sprite = data["state_sprite"]
    duration = data["duration"]
    stack = data["stack"]

func _add_stack(amount: int) -> void:
    if k_stackable:
        stack = min(stack + amount, k_max_stack)

func _reduce_stack(amount: int) -> void:
    if k_stackable:
        stack = max(stack - amount, 0)

func frame_process(delta: float) -> void:
    if !k_is_permanent:
        if duration > 0.0 and stack > 0:
            duration -= delta
        else:
            duration = 0.0
            if stack > 0:
                stack -= 1
                duration = k_max_duration
    if stack == 0:
        state_expired.emit(self)
    print("State: %s, Duration: %f, Stack: %d" % [k_name, duration, stack])
    return
