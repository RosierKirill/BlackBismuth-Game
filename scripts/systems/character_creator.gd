extends Node

class_name CharacterCreator

signal character_created(character_data: Dictionary)

var character_data = {
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
	
	var stats = _calculate_character_stats()
	character_data["stats"] = stats
	
	character_created.emit(character_data)
	return character_data

func _calculate_character_stats() -> Dictionary:
	var morph_stats = Constants.MORPHOLOGY_STATS[character_data["morphology"].duplicate()]
	var temp_mods = Constants.TEMPERAMENT_MODIFIERS[character_data["temperament"]]
	var class_mods = Constants.CLASS_STATS[character_data["class"]]
	
	# Apply temperament modifiers
	for stat in temp_mods:
		if stat in morph_stats:
			morph_stats[stat] *= temp_mods[stat]
		
	# Apply class modifiers
	for stat in class_mods:
		if stat in morph_stats:
			morph_stats[stat] *= class_mods[stat]
		
	return morph_stats

func set_appearance(hair_type: String, hair_color: String, skin_color: String):
	character_data["appearance"]["hair_type"] = hair_type
	character_data["appearance"]["hair_color"] = hair_color
	character_data["appearance"]["skin_color"] = skin_color
