extends Area2D
class_name Fireball

export (int) var speed = 50

var direction: = Vector2.ZERO

func _physics_process(delta: float) -> void:
	if direction != Vector2.ZERO:
		var velocity = direction * speed
		global_position += velocity

func set_direction(direction: Vector2):
	self.direction = direction
	rotation += direction.angle()


func _on_Fireball_body_entered(body: Node) -> void:
	if body.has_method("handle_hit"):
		body.handle_hit()
		queue_free()


func _on_screen_exited() -> void:
	queue_free()

