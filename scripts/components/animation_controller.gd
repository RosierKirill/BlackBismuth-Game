extends Node

class_name AnimationController

@onready var animated_sprite = $"../AnimatedSprite2D"

func update_animation(state: String, input_vector: Vector2) -> void:
\tmatch state:
\t\t"idle":
\t\t\tanimated_sprite.play("idle")
\t\t"run":
\t\t\tanimated_sprite.play("run")
\t\t\tif input_vector.x < 0:
\t\t\t\tanimated_sprite.flip_h = true
\t\t\telse:
\t\t\t\tanimated_sprite.flip_h = false
\t\t"jump":
\t\t\tanimated_sprite.play("jump")
\t\t"attack":
\t\t\tanimated_sprite.play("attack")
\t\t"dead":
\t\t\tanimated_sprite.play("dead")

func play_attack_animation() -> void:
\tanimated_sprite.play("attack")
