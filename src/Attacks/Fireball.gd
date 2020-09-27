extends Area2D
class_name Fireball

export (int) var speed = 75
var direction: = Vector2.ZERO
var timer

func _ready() -> void:
	timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(0.1)
	timer.connect("timeout", self, "on_timeout_complete")
	add_child(timer)


func _physics_process(delta: float) -> void:
	
	if direction != Vector2.ZERO:
		var velocity = direction * speed
		global_position += velocity

func set_direction(direction: Vector2):
	self.direction = direction
	rotation += direction.angle()

func on_timeout_complete():
	queue_free()

func _on_Fireball_body_entered(body: Node) -> void:
	$AnimatedSprite.visible = true
	$AnimatedSprite.play("default")
	$AudioStreamPlayer2D.play(0.65)
	if body.has_method("handle_hit"):
		body.handle_hit()
	timer.start()



func _on_screen_exited() -> void:
	queue_free()

