extends Node

class_name AttackState

@export var attack_duration := 0.5

@onready var state_machine = get_parent()

var attack_timer := 0.0

func enter(player: Player, previous_state: String) -> void:
	attack_timer = 0.0
	player.perform_attack()

func handle_input(input_vector: Vector2) -> void:
	pass

func process_physics(delta: float, velocity: Vector2, player: Player) -> Vector2:
	attack_timer += delta
	velocity.x = 0.0

	if attack_timer >= attack_duration:
		if not player.is_on_floor():
			state_machine.change_state("jump")
		elif is_zero_approx(Input.get_axis("ui_left", "ui_right")):
			state_machine.change_state("idle")
		else:
			state_machine.change_state("run")

	return velocity

func exit(player: Player) -> void:
	attack_timer = 0.0
	player.stop_attack()
