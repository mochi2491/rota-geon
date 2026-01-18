class_name StatePanelView
extends Control

var _stack_count_label: Label
var _texture_rect: TextureRect
var _texture_shadow: TextureRect

var model: State

func _ready() -> void:
    _stack_count_label = get_node("StackCountLabel")
    _texture_rect = get_node("StateTexture")
    _texture_shadow = get_node("ShadowTexture")