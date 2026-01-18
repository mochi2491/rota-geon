class_name StateSlotView
extends Control

var _state_grid: GridContainer
var model: StateList

func init():
    model.state_added.connect(OnStateAdded)
    model.state_removed.connect(OnStateRemoved)

func _ready() -> void:
    _state_grid = get_node("GridContainer")

func OnStateAdded(state: State):
    # state_panelプレハブを追加
    var state_panel = preload("res://Scenes/state_panel.tscn").instantiate()
    state_panel.model = state
    _state_grid.add_child(state_panel)
    return

func OnStateRemoved(state: State):
    # 対応するstate_panelを削除
    for child in _state_grid.get_children():
        if child is StatePanelView and child.model == state:
            _state_grid.remove_child(child)
            child.queue_free()
    return