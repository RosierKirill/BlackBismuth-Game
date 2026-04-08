# Architecture Documentation

## Tech Stack
- **Game Engine**: Godot 4.x
- **Scripting Language**: GDScript

## Folder Structure
```
BlackBismuth-Game/
│
├── scenes/
│   ├── main.tscn
│   ├── Player/
│   ├── Enemies/
│   └── Items/
│
├── scripts/
│   ├── Player.gd
│   ├── Enemy.gd
│   ├── Item.gd
│   └── GameState.gd
│
├── components/
│   ├── HealthComponent.gd
│   ├── CombatComponent.gd
│   └── InventoryComponent.gd
│
├── systems/
│   ├── CombatSystem.gd
│   ├── DungeonGenerationSystem.gd
│   └── BossMechanicsSystem.gd
│
└── assets/
    ├── sprites/
    ├── sounds/
    └── music/
```

## Component-Based Design Patterns
- **Components** are lightweight, reusable pieces of functionality.
- Examples: `HealthComponent`, `CombatComponent`, and `InventoryComponent` for characters and items.
- Encourages separation of concerns and modular design.

## State Machine Architecture
- **Game States**: Main Menu, Playing, Paused, Game Over
- Each state controls its own behavior and transitions to other states based on inputs and events.
- Implemented in `GameState.gd`.

## Key Systems
### Combat System
- Handles interactions between Player and Enemies.
- Manages attack animations, health deductions, and damage calculations.

### Dungeon Generation
- Randomly creates dungeon layouts with rooms and corridors.
- Utilizes algorithms for pathfinding and room connections.

### Boss Mechanics
- Unique behaviors and patterns for bosses.
- Includes health phases, special attacks, and victory conditions.