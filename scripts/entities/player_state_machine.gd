extends Node

class_name PlayerStateMachine

var player: Player
var current_state := "idle"
var velocity := Vector2.ZERO

@onready var idle_state = $IdleState
@onready var run_state = $RunState
@onready var jump_state = $JumpState
@onready var attack_state = $AttackState
@onready var dead_state = $DeadState

var states := {}

func _ready() -> void:
	states = {
		"idle": idle_state,
		"run": run_state,
		"jump": jump_state,
		"attack": attack_state,
		"dead": dead_state
	}

func initialize(owner_player: Player) -> void:
	player = owner_player
	velocity = owner_player.velocity
	_enter_state(current_state, "")

func process_input(input_vector: Vector2) -> void:
	if current_state in states:
		states[current_state].handle_input(input_vector)

func process_physics(delta: float) -> void:
	if current_state in states:
		velocity = states[current_state].process_physics(delta, velocity, player)

func change_state(new_state: String) -> void:
	if not states.has(new_state) or new_state == current_state:
		return

	var previous_state := current_state
	var previous_state_node = states.get(previous_state)
	if previous_state_node != null and previous_state_node.has_method("exit"):
		previous_state_node.exit(player)

	current_state = new_state
	_enter_state(new_state, previous_state)

func _enter_state(state_name: String, previous_state: String) -> void:
	var state_node = states.get(state_name)
	if state_node != null and state_node.has_method("enter"):
		state_node.enter(player, previous_state)
