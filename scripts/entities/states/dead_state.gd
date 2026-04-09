extends Node

class_name DeadState

func enter(player: Player, previous_state: String) -> void:
	player.stop_attack()

func handle_input(input_vector: Vector2) -> void:
	pass

func process_physics(delta: float, velocity: Vector2, player: Player) -> Vector2:
	return Vector2.ZERO
