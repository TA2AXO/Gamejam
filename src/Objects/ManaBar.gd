extends HBoxContainer

signal maximum_changed(maximum)

var maximum = 100
var current_mana = 0

func initialize(max_value):
	maximum = max_value
	emit_signal("maximum_changed", maximum)

func _on_Interface_mana_changed(mana) -> void:
	animate_value(current_mana, mana)
	current_mana = mana


func animate_value(start, end):
	$Tween.interpolate_property($ManaDoluluk, "value", start, end, 0.5, Tween.TRANS_ELASTIC, Tween.EASE_OUT)
	$Tween.start()
