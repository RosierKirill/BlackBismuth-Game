extends Node

class_name StatComponent

var health: int
var attack_power: int
var defense: int

func _init(health: int, attack_power: int, defense: int):
    self.health = health
    self.attack_power = attack_power
    self.defense = defense

func take_damage(amount: int) -> void:
    health = max(health - amount, 0)

func is_alive() -> bool:
    return health > 0
