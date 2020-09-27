extends "res://src/actors/Actor.gd"

export var health: = 40.0

func _ready() -> void:
	set_physics_process(false)
	_velocity.x = -speed.x

func hareket(linear_velocity: Vector2):
	if linear_velocity.x > 255:
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("default")
	elif linear_velocity.x < 0:
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("default")

func _physics_process(delta: float) -> void:
	_velocity.y += gravity * delta
	if is_on_wall():
		_velocity *= -1.0
	hareket(_velocity)
	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y

func handle_hit():
	health -= 20.0
	if health <= 0:
		queue_free()

func _on_screen_exited() -> void:
	pass # Replace with function body.
