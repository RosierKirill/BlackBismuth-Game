extends Node

class_name RunState

@onready var state_machine = get_parent()

func handle_input(input_vector: Vector2) -> void:
	if Input.is_action_just_pressed("attack"):
		state_machine.change_state("attack")
	elif Input.is_action_just_pressed("jump") and state_machine.player.is_on_floor():
		state_machine.change_state("jump")
	elif is_zero_approx(input_vector.x):
		state_machine.change_state("idle")

func process_physics(delta: float, velocity: Vector2, player: Player) -> Vector2:
	if not player.is_on_floor():
		state_machine.change_state("jump")
		return velocity

	var input_vector := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity.x = input_vector.x * player.speed
	if is_zero_approx(input_vector.x):
		velocity.x = move_toward(velocity.x, 0.0, player.speed * delta * 8.0)
	return velocity
