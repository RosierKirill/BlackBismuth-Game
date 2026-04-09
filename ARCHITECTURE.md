# Architecture Documentation

## Tech Stack
- **Game Engine**: Godot 4.x
- **Scripting Language**: GDScript

## Current Repository Structure
```text
BlackBismuth-Game/
│
├── constants.gd
├── scripts/
│   ├── components/
│   │   ├── animation_controller.gd
│   │   ├── health_component.gd
│   │   └── stat_component.gd
│   ├── entities/
│   │   ├── player.gd
│   │   ├── player_state_machine.gd
│   │   └── states/
│   │       ├── attack_state.gd
│   │       ├── dead_state.gd
│   │       ├── idle_state.gd
│   │       ├── jump_state.gd
│   │       └── run_state.gd
│   └── systems/
│       └── character_creator.gd
└── ARCHITECTURE.md
```

## Gameplay Architecture

### Player Entity
- `player.gd` pilote le déplacement, la gravité, les dégâts, le soin et la synchronisation avec la machine à états.
- Le script s'appuie sur les propriétés natives de `CharacterBody2D` de Godot 4, notamment `velocity` et `move_and_slide()`.

### Components
- `stat_component.gd` centralise les statistiques du personnage et expose un dictionnaire `character_stats` cohérent.
- `health_component.gd` gère les points de vie, les soins, les dégâts et le signal `died`.
- `animation_controller.gd` traduit l'état courant en animation Godot.

### State Machine
- `player_state_machine.gd` orchestre les transitions `idle`, `run`, `jump`, `attack` et `dead`.
- Chaque état est isolé dans son propre script et peut définir `enter`, `handle_input`, `process_physics` et `exit`.
- Les transitions critiques corrigées sont le saut (impulsion appliquée une seule fois) et l'attaque (timer réinitialisé à chaque entrée).

### Character Creation
- `character_creator.gd` construit un personnage à partir d'une morphologie, d'un tempérament et d'une classe.
- `constants.gd` fournit les profils de base et les multiplicateurs appliqués à ces profils.

## Current Limitations
- Le dépôt ne contient pas encore de `project.godot`.
- Aucune scène `.tscn` n'est versionnée pour instancier le joueur et ses composants.
- Les actions d'entrée personnalisées comme `attack` et `jump` devront être déclarées dans le projet Godot.

## Next Recommended Steps
- Ajouter les scènes Godot minimales (`main.tscn`, `player.tscn`) pour brancher les scripts.
- Déclarer les inputs `attack` et `jump` dans les paramètres du projet.
- Ajouter des ennemis et des interactions de combat maintenant que les contrats de base sont cohérents.
