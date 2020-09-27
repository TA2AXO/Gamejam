extends "res://src/actors/Actor.gd"

var player = null

onready var sprite: Sprite = $enemy
const DISTANCE_THRESHOLD: = 3.0
export var max_speed = 500.0
var health: int = 40

func _ready() -> void:
	pass

func _on_Area2D_body_entered(body: Node) -> void:
	queue_free()

func _physics_process(delta):
	_velocity.y += gravity * delta
	following()
	hareket(_velocity)
	move_and_slide(_velocity)

func hareket(linear_velocity: Vector2):
	if linear_velocity.x > 250.0:
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("default")
	elif linear_velocity.x < 0.0:
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("default")

func following():
	if player != null:
		var target_global_position: Vector2 = player.position
		if global_position.distance_to(target_global_position) < DISTANCE_THRESHOLD:
			return
		_velocity = Fallowing.follow(_velocity,global_position,target_global_position,max_speed)

func _on_body_entered(body: Node) -> void:
	if body != self:
		player = body


func _on_body_exited(body: Node) -> void:
	player = null


func _on_Timer_timeout() -> void:
	pass


func _on_screen_exited() -> void:
	pass # Replace with function body.


func _on_area_shape_entered(area_id: int, area: Area2D, area_shape: int, self_shape: int) -> void:
	queue_free()

func handle_hit():
	health -= 20
	if health <= 0:
		queue_free()
