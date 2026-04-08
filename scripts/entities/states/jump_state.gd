extends Node

class_name JumpState

@onready var state_machine = get_parent()

func handle_input(input_vector: Vector2) -> void:
\tpass

func process_physics(delta: float, velocity: Vector2, player: Player) -> Vector2:
\tvelocity.y = player.jump_force
\tif player.is_on_floor():
\t\tstate_machine.change_state("idle")
\treturn velocity
