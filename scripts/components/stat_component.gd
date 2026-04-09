extends Node

class_name StatComponent

@export var base_stats: Dictionary = Constants.DEFAULT_CHARACTER_STATS

var character_stats: Dictionary = {}

func _ready() -> void:
	if character_stats.is_empty():
		character_stats = base_stats.duplicate(true)
	_normalize_stats()

func set_character_stats(stats: Dictionary) -> void:
	character_stats = base_stats.duplicate(true)
	for stat_name in stats:
		character_stats[stat_name] = stats[stat_name]
	_normalize_stats()

func get_character_stats() -> Dictionary:
	if character_stats.is_empty():
		character_stats = base_stats.duplicate(true)
		_normalize_stats()
	return character_stats.duplicate(true)

func get_attack_power() -> int:
	return int(character_stats.get("attack_power", 0))

func get_defense() -> int:
	return int(character_stats.get("defense", 0))

func is_alive() -> bool:
	return int(character_stats.get("hp", 0)) > 0

func _normalize_stats() -> void:
	for stat_name in Constants.DEFAULT_CHARACTER_STATS:
		if not character_stats.has(stat_name):
			character_stats[stat_name] = Constants.DEFAULT_CHARACTER_STATS[stat_name]

		var value = character_stats[stat_name]
		if typeof(value) == TYPE_FLOAT:
			character_stats[stat_name] = snappedf(value, 0.01)
