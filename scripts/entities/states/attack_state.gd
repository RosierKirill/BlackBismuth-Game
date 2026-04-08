extends Node

class_name AttackState

@onready var state_machine = get_parent()
var attack_timer = 0.0

func handle_input(input_vector: Vector2) -> void:
\tpass

func process_physics(delta: float, velocity: Vector2, player: Player) -> Vector2:
\tattack_timer += delta
\tif attack_timer > 0.5:
\t\tstate_machine.change_state("idle")
\treturn velocity
