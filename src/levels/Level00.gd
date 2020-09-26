extends Node2D

onready var spell_manager = $SpellManager
onready var player = $Player

func _ready() -> void:
	player.connect("player_spelling_fireball", spell_manager, "handle_spell_spawned")
