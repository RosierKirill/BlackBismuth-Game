extends CharacterBody2D

class_name Player

@export var speed = 200.0
@export var jump_force = -400.0
@export var gravity = 800.0

var is_attacking = false
var current_class = "épéiste"
var character_stats = {}

@onready var animation_controller = $AnimationController
@onready var state_machine = $StateMachine
@onready var health_component = $HealthComponent
@onready var stat_component = $StatComponent

var velocity = Vector2.ZERO

func _ready():
\t_initialize_player()
\tstate_machine.player = self
\thealth_component.died.connect(_on_player_died)

func _initialize_player():
\tcharacter_stats = stat_component.character_stats
\thealth_component.max_health = int(character_stats.get("hp", 100))
\thealth_component.current_health = health_component.max_health

func _physics_process(delta):
\t# Apply gravity
\tif not is_on_floor():
\t\tvelocity.y += gravity * delta
\t\n\t# Handle input
\tvar input_vector = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
\t\n\t# Update state machine
\tstate_machine.process_input(input_vector)
\tstate_machine.process_physics(delta)
\t\n\tvelocity = state_machine.velocity
\tvelocity = move_and_slide(velocity)
\t\n\t# Update animation
\tanimation_controller.update_animation(state_machine.current_state, input_vector)

func take_damage(damage: int) -> void:
\thealth_component.take_damage(damage)

func heal(amount: int) -> void:
\thealth_component.heal(amount)

func perform_attack() -> void:
\tif not is_attacking:
\t\tis_attacking = true
\t\tanimation_controller.play_attack_animation()
\t\tawait get_tree().create_timer(0.5).timeout
\t\tis_attacking = false

func _on_player_died():
\tstate_machine.change_state("dead")
