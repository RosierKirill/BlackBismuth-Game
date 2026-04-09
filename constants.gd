extends RefCounted

class_name Constants

const PLAYER_MAX_HEALTH := 100
const ENEMY_MAX_HEALTH := 50
const ENEMY_COUNT := 10
const LEVEL_COUNT := 5
const SCORE_PER_ENEMY := 10

const DEFAULT_CHARACTER_STATS := {
	"hp": PLAYER_MAX_HEALTH,
	"attack_power": 12,
	"defense": 6,
	"speed": 200.0,
	"jump_force": -400.0
}

const DEFAULT_MORPHOLOGY := "equilibre"
const DEFAULT_TEMPERAMENT := "calme"
const DEFAULT_CLASS := "épéiste"

const MORPHOLOGY_STATS := {
	"equilibre": {
		"hp": 100,
		"attack_power": 12,
		"defense": 6,
		"speed": 200.0,
		"jump_force": -400.0
	},
	"agile": {
		"hp": 85,
		"attack_power": 10,
		"defense": 4,
		"speed": 240.0,
		"jump_force": -440.0
	},
	"robuste": {
		"hp": 120,
		"attack_power": 14,
		"defense": 8,
		"speed": 170.0,
		"jump_force": -360.0
	}
}

const TEMPERAMENT_MODIFIERS := {
	"calme": {
		"defense": 1.15
	},
	"audacieux": {
		"attack_power": 1.20,
		"speed": 1.05
	},
	"fougueux": {
		"attack_power": 1.10,
		"jump_force": 1.05
	}
}

const CLASS_STATS := {
	"épéiste": {
		"hp": 1.00,
		"attack_power": 1.20,
		"defense": 1.10,
		"speed": 1.00,
		"jump_force": 1.00
	},
	"archer": {
		"hp": 0.90,
		"attack_power": 1.10,
		"defense": 0.90,
		"speed": 1.15,
		"jump_force": 1.05
	},
	"mage": {
		"hp": 0.85,
		"attack_power": 1.35,
		"defense": 0.85,
		"speed": 1.00,
		"jump_force": 0.95
	}
}
