class_name StateList
extends RefCounted

var _states: Array[State] = []

signal state_added(state: State)
signal state_removed(state: State)

func _add_state(state: State) -> void:
    if _states.has(state):
        _states[_states.find(state)]._add_stack(1)
        return
    _states.append(state)
    state_added.emit(state)
    state.state_expired.connect(on_state_expired)

func on_state_expired(state: State) -> void:
    if _states.has(state):
        _states.erase(state)
    state_removed.emit(state)
    return

func frame_process(delta: float) -> void:
    for state in _states:
        state.frame_process(delta)
    return