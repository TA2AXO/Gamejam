extends Control

signal health_changed(health)
signal mana_changed(mana)

func _ready() -> void:
	var health_node = null
	var mana_node = null
	for node in get_tree().get_nodes_in_group("actors"):
		if node.name == "Player":
			health_node = node.get_node("Health")
			mana_node = node.get_node("Mana")
			break
	get_node("HBar/Lifebar").initialize(health_node.max_health)
	get_node("MBar/ManaBar").initialize(mana_node.max_mana)

func _on_health_changed(health) -> void:
	emit_signal("health_changed", health)

func _on_mana_changed(mana) -> void:
	emit_signal("mana_changed", mana)
