extends Node

class_name PlayerStateMachine

var player: Player
var current_state = "idle"
var velocity = Vector2.ZERO

@onready var idle_state = $IdleState
@onready var run_state = $RunState
@onready var jump_state = $JumpState
@onready var attack_state = $AttackState
@onready var dead_state = $DeadState

var states = {}

func _ready():
\tstates = {
\t\t"idle": idle_state,
\t\t"run": run_state,
\t\t"jump": jump_state,
\t\t"attack": attack_state,
\t\t"dead": dead_state
\t}

func process_input(input_vector: Vector2) -> void:
\tif current_state in states:
\t\tstates[current_state].handle_input(input_vector)

func process_physics(delta: float) -> void:
\tif current_state in states:
\t\tvelocity = states[current_state].process_physics(delta, velocity, player)

func change_state(new_state: String) -> void:
\tif new_state in states:
\t\tcurrent_state = new_state
