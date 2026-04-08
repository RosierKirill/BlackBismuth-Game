extends Node

class_name IdleState

@onready var state_machine = get_parent()

func handle_input(input_vector: Vector2) -> void:
\tif input_vector.x != 0:
\t\tstate_machine.change_state("run")
\telif Input.is_action_just_pressed("attack"):
\t\tstate_machine.change_state("attack")
\telif Input.is_action_just_pressed("jump"):
\t\tstate_machine.change_state("jump")

func process_physics(delta: float, velocity: Vector2, player: Player) -> Vector2:
\treturn velocity
