extends Node2D

onready var spell_manager = $SpellManager
onready var player = $Player

func _ready() -> void:
	player.connect("player_spelling_fireball", spell_manager, "handle_spell_spawned")

func _on_Giri_finished() -> void:
	$Gecis.play()

func _on_Gecis_finished() -> void:
	$Fon.get_stream_playback()
	$Fon.play()
