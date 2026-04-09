extends Node

class_name JumpState

@onready var state_machine = get_parent()

var has_left_floor := false

func enter(player: Player, previous_state: String) -> void:
	has_left_floor = false
	if previous_state != "jump" and player.is_on_floor():
		state_machine.velocity.y = player.jump_force

func handle_input(input_vector: Vector2) -> void:
	pass

func process_physics(delta: float, velocity: Vector2, player: Player) -> Vector2:
	var input_vector := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity.x = input_vector.x * player.speed

	if not player.is_on_floor():
		has_left_floor = true

	if has_left_floor and player.is_on_floor() and velocity.y >= 0.0:
		if is_zero_approx(input_vector.x):
			state_machine.change_state("idle")
		else:
			state_machine.change_state("run")

	return velocity
