extends Node

class_name RunState

@onready var state_machine = get_parent()

func handle_input(input_vector: Vector2) -> void:
\tif input_vector.x == 0:
\t\tstate_machine.change_state("idle")
\telif Input.is_action_just_pressed("attack"):
\t\tstate_machine.change_state("attack")
\telif Input.is_action_just_pressed("jump"):
\t\tstate_machine.change_state("jump")

func process_physics(delta: float, velocity: Vector2, player: Player) -> Vector2:
\tvar input_vector = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
\tvelocity.x = input_vector.x * player.speed
\treturn velocity
