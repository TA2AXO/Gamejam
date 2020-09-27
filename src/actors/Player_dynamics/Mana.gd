extends Node

signal mana_changed(mana)
signal mana_depleted

var mana = 0
export(int) var max_mana = 100

func _ready():
	mana = max_mana
	emit_signal("mana_changed", mana)

func casting_spell(amount):
	mana -= amount
	mana = max(0, mana)
	emit_signal("mana_changed", mana)

func mana_heal(amount):
	mana += amount
	mana = max(mana, max_mana)
	emit_signal("mana_changed", mana)
