extends Actor

signal player_spelling_fireball(Fireboll, position, direction)
export (PackedScene) var Fireboll

onready var health: = 100.0
onready var staff = $Staff
onready var spell_direction = $SpellDirection

func _physics_process(delta: float) -> void:
	var direction: = get_direction()
	var is_jump_interrupted: = Input.is_action_just_released("jump") and _velocity.y < 0.0
	_velocity = calculate_move_velocity(_velocity, direction, speed, is_jump_interrupted)
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL)


func get_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-1.0 if Input.is_action_just_pressed("jump") and is_on_floor() else 1.0
		)

func calculate_move_velocity(
		linear_velocity: Vector2,
		direction: Vector2,
		speed: Vector2,
		is_jump_interrupted: bool
	) -> Vector2:
	var out: = linear_velocity
	out.x = speed.x * direction.x
	out.y += gravity * get_physics_process_delta_time()
	if direction.y == -1.0:
		out.y = speed.y * direction.y
	if is_jump_interrupted:
		out.y = 0.0
	return out

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_released("attack"):
		casting()

func casting():
	var spell_instance  = Fireboll.instance()
	var target = get_global_mouse_position()
	var direction = staff.global_position.direction_to(target).normalized()
	emit_signal("player_spelling_fireball", spell_instance, staff.global_position, direction)

func _on_body_entered(body: Node) -> void:
	queue_free()
