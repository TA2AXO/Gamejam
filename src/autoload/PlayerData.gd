extends Node

signal player_died
signal gain_mana

var deaths: = 0 setget set_deaths
var manaadd: = 0 setget set_mana

func set_mana(value: int) -> void:
	manaadd = value
	emit_signal("gain_mana")

func set_deaths(value: int) -> void:
	deaths = value
	emit_signal("player_died")
