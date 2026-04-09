extends Node

class_name CharacterCreator

signal character_created(character_data: Dictionary)

var character_data := {
	"name": "",
	"morphology": "",
	"temperament": "",
	"class": "",
	"appearance": {
		"hair_type": "",
		"hair_color": "",
		"skin_color": ""
	}
}

func create_character(name: String, morphology: String, temperament: String, character_class: String) -> Dictionary:
	character_data["name"] = name
	character_data["morphology"] = morphology
	character_data["temperament"] = temperament
	character_data["class"] = character_class

	var stats := _calculate_character_stats()
	character_data["stats"] = stats

	var created_character := character_data.duplicate(true)
	character_created.emit(created_character)
	return created_character

func _calculate_character_stats() -> Dictionary:
	var morphology_name := character_data.get("morphology", Constants.DEFAULT_MORPHOLOGY)
	var temperament_name := character_data.get("temperament", Constants.DEFAULT_TEMPERAMENT)
	var class_name_value := character_data.get("class", Constants.DEFAULT_CLASS)

	var morph_stats := Constants.MORPHOLOGY_STATS.get(
		morphology_name,
		Constants.DEFAULT_CHARACTER_STATS
	).duplicate(true)
	var temp_mods := Constants.TEMPERAMENT_MODIFIERS.get(temperament_name, {})
	var class_mods := Constants.CLASS_STATS.get(class_name_value, {})

	for stat_name in temp_mods:
		if morph_stats.has(stat_name):
			morph_stats[stat_name] *= temp_mods[stat_name]

	for stat_name in class_mods:
		if morph_stats.has(stat_name):
			morph_stats[stat_name] *= class_mods[stat_name]

	for stat_name in morph_stats:
		if typeof(morph_stats[stat_name]) == TYPE_FLOAT:
			morph_stats[stat_name] = snappedf(morph_stats[stat_name], 0.01)

	return morph_stats

func set_appearance(hair_type: String, hair_color: String, skin_color: String) -> void:
	character_data["appearance"]["hair_type"] = hair_type
	character_data["appearance"]["hair_color"] = hair_color
	character_data["appearance"]["skin_color"] = skin_color
