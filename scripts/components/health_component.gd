extends Node

class_name HealthComponent

signal died
signal health_changed(current_health: int, max_health: int)

@export var max_health: int = Constants.PLAYER_MAX_HEALTH
@export var current_health: int = Constants.PLAYER_MAX_HEALTH

func _ready() -> void:
	max_health = max(1, max_health)
	current_health = clamp(current_health, 0, max_health)

func set_health(max_value: int, current_value: int = -1) -> void:
	max_health = max(1, max_value)
	if current_value < 0:
		current_health = max_health
	else:
		current_health = clamp(current_value, 0, max_health)
	health_changed.emit(current_health, max_health)

func take_damage(amount: int) -> void:
	var applied_damage := max(amount, 0)
	if applied_damage == 0 or current_health <= 0:
		return

	current_health = max(current_health - applied_damage, 0)
	health_changed.emit(current_health, max_health)

	if current_health == 0:
		died.emit()

func heal(amount: int) -> void:
	var applied_heal := max(amount, 0)
	if applied_heal == 0 or current_health <= 0:
		return

	current_health = min(current_health + applied_heal, max_health)
	health_changed.emit(current_health, max_health)

func is_alive() -> bool:
	return current_health > 0
