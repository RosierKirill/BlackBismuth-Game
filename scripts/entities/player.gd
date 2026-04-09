extends CharacterBody2D

class_name Player

@export var speed := 200.0
@export var jump_force := -400.0
@export var gravity := 800.0

var is_attacking := false
var current_class := Constants.DEFAULT_CLASS
var character_stats := {}

@onready var animation_controller: AnimationController = $AnimationController
@onready var state_machine: PlayerStateMachine = $StateMachine
@onready var health_component: HealthComponent = $HealthComponent
@onready var stat_component: StatComponent = $StatComponent

func _ready() -> void:
	_initialize_player()
	state_machine.initialize(self)
	health_component.died.connect(_on_player_died)

func _initialize_player() -> void:
	character_stats = stat_component.get_character_stats()
	speed = float(character_stats.get("speed", speed))
	jump_force = float(character_stats.get("jump_force", jump_force))
	health_component.set_health(int(character_stats.get("hp", Constants.PLAYER_MAX_HEALTH)))

func _physics_process(delta: float) -> void:
	if state_machine.current_state != "dead" and not is_on_floor():
		velocity.y += gravity * delta

	var input_vector := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	state_machine.process_input(input_vector)
	state_machine.process_physics(delta)

	velocity = state_machine.velocity
	move_and_slide()
	state_machine.velocity = velocity

	animation_controller.update_animation(state_machine.current_state, input_vector)

func take_damage(damage: int) -> void:
	health_component.take_damage(damage)

func heal(amount: int) -> void:
	health_component.heal(amount)

func perform_attack() -> void:
	if is_attacking or state_machine.current_state == "dead":
		return

	is_attacking = true
	animation_controller.play_attack_animation()

func stop_attack() -> void:
	is_attacking = false

func _on_player_died() -> void:
	state_machine.change_state("dead")
