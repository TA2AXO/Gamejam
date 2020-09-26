extends Node2D

func handle_spell_spawned(Fireboll: Fireball, position: Vector2, direction: Vector2):
	add_child(Fireboll)
	Fireboll.global_position = position
	Fireboll.set_direction(direction)
