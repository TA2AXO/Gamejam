extends HBoxContainer

signal maximum_changed(maximum)

var maximum = 0
var current_health = 0

func initialize(max_value):
	maximum = max_value
	emit_signal("maximum_changed", maximum)

func _on_Interface_health_changed(health) -> void:
	animate_value(current_health, health)
	current_health = health


func animate_value(start, end):
	$Tween.interpolate_property($CanDoluluk, "value", start, end, 0.5, Tween.TRANS_ELASTIC, Tween.EASE_OUT)
	$Tween.start()


