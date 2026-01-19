class_name TextWindowView
extends Control

var text: Label
var window: TextureRect
var timer: Timer
var tween: Tween

const wait_time = 2.0

func _ready():
	text = get_node("Text")
	window = get_node("Window")
	timer = get_node("Timer")
	timer.wait_time = 2.0
	timer.one_shot = true
	timer.connect("timeout", Callable(self, "on_timer_timeout"))
	return

func _change_text(str: String):
	text.text = str
	return

func _display_text_window(str: String):
	self.modulate.a = 1.0
	text.text = str
	timer.start()
	return

func _delete_text_window():
	text.text = ""
	return

func on_timer_timeout():
	tween = create_tween()
	tween.finished.connect(_delete_text_window)
	tween.tween_property(self, "modulate:a", 0.0, 0.75)
	return

func _process(delta):
	print(self.modulate.a)
	return
